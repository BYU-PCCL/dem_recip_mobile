from flask import Flask, request, jsonify, abort
from data_model.dto.user import User
from state.states import UserState
from data_model.dao_factory.factory import FactoryProvider
from service.user_service import UserService
from service.user_convo_service import UserConvoService
from service.convo_service import ConvoService
import os
from functools import wraps

from dotenv import load_dotenv

env_path = os.path.join(os.path.dirname(__file__), '../.env')
load_dotenv(dotenv_path=env_path)

app = Flask(__name__)

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
            factory = FactoryProvider.getFactory()
            userdao = factory.get_userdao()
            user_service = UserService(userdao)
            valid, message = user_service.validate(token)
            if not valid:
                return {
                "message": message,
                "error": "Unauthorized"
            }, 401
        except Exception as e:
            return {
                "message": "Something went wrong",
                "error": str(e)
            }, 500

        return f(*args, **kwargs)

    return decorated


    

@app.route('/')
def home():
    return 'Hello, World!'

@app.route('/edit_profile')
@token_required
def edit_profile():
    body = request.json

    data = body['data']


@app.route('/user/get_state', methods=["POST"])
@token_required
def get_state():
    body = request.get_json()

    if 'username' not in body:
        return {
            "message": "Username was not included in request body",
            "data": None,
            "error": "No username"
        }, 400

    username = body['username']

    factory = FactoryProvider.getFactory()
    userdao = factory.get_userdao()

    user_service = UserService(userdao)
    user = user_service.get_user(username)

    if not user:
        return {'data': 1}, 200
    else:
        return {'data': 2}, 200
    

@app.route('/user/update_user', methods=["POST"])
@token_required
def update_user():
    body = request.get_json()

    if 'username' not in body or 'data' not in body:
        return {
            "message": "Username was not included in request body",
            "data": None,
            "error": "No username"
        }, 400
    try:
        username = body['username']
        data = body['data']

        factory = FactoryProvider.getFactory()
        userdao = factory.get_userdao()

        user_service = UserService(userdao)
        user_service.update_user(username, data)

        return {
            'data': None
        }, 200

    except Exception as e:
        return {
            "message": "An unexpected error occurred on the server",
            "error": e
        }, 500
    

@app.route('/user/get_conversations', methods=["POST"])
@token_required
def get_conversations():
    body = request.get_json()

    if 'username' not in body:
        return {
            "message": "username was not included in body",
            "data": None,
            "error": "Missing username"
        }, 400
    try:
        username = body['username']

        factory = FactoryProvider.getFactory()
        userdao = factory.get_userdao()
        convodao = factory.get_convodao()

        user_service = UserService(userdao)
        convos = user_service.get_conversations(username, convodao)

        return {
            'data': convos
        }, 200

    except Exception as e:
        return {
            "message": "An unexpected error occurred on the server",
            "error": e
        }, 500
    

@app.route('/user_convo/create', methods=["POST"])
@token_required
def create_user_convo():
    body = request.get_json()

    for field in {'username', 'convoId', 'stance', 'treatment'}:
        if field not in body:
            return {
                "message": f"{field} included in the body",
                "data": None,
                "error": f"Missing field: {field}"
            }, 400
    try:

        factory = FactoryProvider.getFactory()
        user_convodao = factory.get_user_convodao()

        user_convo_service = UserConvoService(user_convodao)
        user_convo_service.create(body)


        return {
            'data': None
        }, 200

    except Exception as e:
        return {
            "message": "An unexpected error occurred on the server",
            "error": e
        }, 500
    

@app.route('/convo/create', methods=["POST"])
@token_required
def create_user_convo():
    body = request.get_json()

    for field in {'convoId', 'topic'}:
        if field not in body:
            return {
                "message": f"{field} included in the body",
                "data": None,
                "error": f"Missing field: {field}"
            }, 400
    
    try:

        factory = FactoryProvider.getFactory()
        convodao = factory.get_convodao()

        convo_service = ConvoService(convodao)
        convo_service.create(body)

        return {
            'data': None
        }, 200

    except Exception as e:
        return {
            "message": "An unexpected error occurred on the server",
            "error": e
        }, 500
    
