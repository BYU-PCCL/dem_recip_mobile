from flask import Flask, request, jsonify, abort
from data_model.dto.user import User
from data_model.dao_factory.factory import FactoryProvider
from service.user_service import UserService
import os
from functools import wraps
import jwt

from dotenv import load_dotenv

env_path = os.path.join(os.path.dirname(__file__), '../.env')
load_dotenv(dotenv_path=env_path)

app = Flask(__name__)

JWT_SECRET = os.environ.get('JWT_SECRET')
app.config['JWT_SECRET'] = JWT_SECRET

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = None
        if "Authorization" in request.headers:
            token = request.headers["Authorization"].split(" ")[1]
        if not token:
            return {
                "message": "Authentication Token is missing!",
                "data": None,
                "error": "Unauthorized"
            }, 401
        try:
            data=jwt.decode(token, app.config["JWT_SECRET"], algorithms=["HS256"])
            factory = FactoryProvider.getFactory()
            user_dao = factory.get_user_dao()
            current_user = user_dao.get_user(data["username"])
            if current_user is None:
                return {
                "message": "Invalid Authentication token!",
                "data": None,
                "error": "Unauthorized"
            }, 401
            if not current_user["active"]:
                abort(403)
        except Exception as e:
            return {
                "message": "Something went wrong",
                "data": None,
                "error": str(e)
            }, 500

        return f(current_user, *args, **kwargs)

    return decorated

@app.route('/')
def home():
    return 'Hello, World!'

@app.route('/login', methods = ['POST'])
def login():
    try:
        data = request.json
        if not data:
            return {
                "message": "Please provide user details",
                "data": None,
                "error": "Bad request"
            }, 400
        
        factory = FactoryProvider.getFactory()
        user_dao = factory.get_user_dao()

        is_validated = user_dao.validate_username_password(data.get('username'), data.get('password'))
        if not is_validated:
            return dict(message='Invalid data', data=None, error=is_validated), 400
        
        user = user_dao.get_user(data.get('username'))

        if user:
            try:
                # token should expire after 24 hrs
                user["token"] = jwt.encode(
                    {"user_id": user["_id"]},
                    app.config["SECRET_KEY"],
                    algorithm="HS256"
                )
                return {
                    "message": "Successfully fetched auth token",
                    "data": user
                }
            except Exception as e:
                return {
                    "error": "Something went wrong",
                    "message": str(e)
                }, 500
        return {
            "message": "Error fetching auth token!, invalid email or password",
            "data": None,
            "error": "Unauthorized"
        }, 404
    except Exception as e:
        return {
                "message": "Something went wrong!",
                "error": str(e),
                "data": None
        }, 500

@app.route('/signup', methods = ['POST'])
def signup():
    try:
        data = request.json
        if not data:
            return {
                "message": "Please provide user details",
                "data": None,
                "error": "Bad request"
            }, 400

        user = User(**data['user'])
        password = data['password']
        user_data = data['data']

        factory = FactoryProvider.getFactory()
        user_dao = factory.get_user_dao()

        service = UserService(user_dao)

        response = service.signup_user(user, password, user_data)

        if response:
            try:
                # token should expire after 24 hrs
                token = jwt.encode(
                    {"username": user.username},
                    app.config["JWT_SECRET"],
                    algorithm="HS256"
                )
                return {
                    "message": "Successfully added user",
                    "token": token
                }
            except Exception as e:
                print(e)
                return {
                    "error": "Something went wrong",
                    "message": str(e)
                }, 500
        return {
            "message": "Error, user already exists",
            "error": "User already exists"
        }, 400
    except Exception as e:
        print(e)
        return {
                "message": "Something went wrong!",
                "error": str(e),
                "data": None
        }, 500