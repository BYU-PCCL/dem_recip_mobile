from firebase_admin import firestore, initialize_app, credentials
import os
import json


class FirestoreDB:  
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            fb_admin_struct = json.loads(os.environ['FIREBASE_AUTH'], strict=False)
            cred = credentials.Certificate(fb_admin_struct)
            initialize_app(cred)
            cls._instance = firestore.client()
        return cls._instance
    
    def get_instance(cls):
        return cls._instance
    