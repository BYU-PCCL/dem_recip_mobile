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

def token_required(f):
    def check_token(*args, **kwargs):
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
            user_dao = factory.get_user_dao()
            valid, message = user_dao.validate_username_password(token)
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

    return check_token


    

@app.route('/')
def home():
    return 'Hello, World!'
