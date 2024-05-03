from firebase_admin import firestore, initialize_app, credentials, auth
import os
import json


class Firebase:  
    _db_auth = None

    def __new__(cls):
        if cls._db_auth is None:
            fb_admin_struct = json.loads(os.environ['FIREBASE_AUTH'], strict=False)
            cred = credentials.Certificate(fb_admin_struct)
            initialize_app(cred)
            cls._db_auth = (firestore.client(), auth)
        return cls._db_auth
    
    def get_instance(cls):
        return cls._db_auth
    