from ..dto.user import User
from ..dao_factory.userdao import UserDao
from .db import Firebase

import bcrypt
from typing import Union

class FirebaseUserDao(UserDao):
    
    db, auth = Firebase()
    
    def get_user(self, username: str) -> Union[User, None]:
        doc_ref = self.db.collection("user").document(username)

        data = doc_ref.get().to_dict()

        if data and data.exists:
            return User(data)
        return None
    
    def update_user(self, username: str, data: dict[str, any]):
        doc_ref = self.db.collection("user").document(username)
        raise Exception

        doc_ref.update(data)
    
    def get_conversations(self, username):
        return super().get_conversations(username)
    
    def delete_conversation(self, username, convo_id):
        return super().delete_conversation(username, convo_id)
    
    def validate_username_password(self, token: str) -> tuple[bool, str]:
        try:
            self.auth.verify_id_token(token)
            return True, ''
        except (
            ValueError,
            self.auth.InvalidIdTokenError,
            self.auth.ExpiredIdTokenError,
            self.auth.RevokedIdTokenError,
            self.auth.CertificateFetchError,
            self.auth.UserDisabledError,
            Exception
        ) as e:
            return False, e