from ..dto.user import User
from ..dao_factory.userdao import UserDao
from .db import FirestoreDB

import bcrypt
from typing import Union

class FirebaseUserDao(UserDao):
    
    db = FirestoreDB()

    def create_user(self, user: User, password: str, data: dict[str, str]) -> bool:
        doc_ref = self.db.collection("user").document(user.username)

        password_bytes = password.encode('utf-8')
        salt = bcrypt.gensalt()
        hashed_password = bcrypt.hashpw(password_bytes, salt)

        if not doc_ref.get().exists:
            doc_ref.set({
                "firstName": user.firstName, 
                "lastName": user.lastName, 
                "password": hashed_password,
                **data
            })
            return True
        else:
            return False
    
    def get_user(self, username: str) -> Union[User, None]:
        doc_ref = self.db.collection("user").document(username)

        data = doc_ref.get().to_dict()

        if data.exists:
            return User(data)
        return None
    
    def update_user(self, username: str, field_name: str, value: str | int):
        return super().update_user(username, field_name, value)
    
    def get_conversations(self, username):
        return super().get_conversations(username)
    
    def delete_conversation(self, username, convo_id):
        return super().delete_conversation(username, convo_id)
    
    def validate_username_password(self, username: str, password: str) -> bool:
        doc_ref = self.db.collection("user").document(username)

        data = doc_ref.get()

        if data.exists:
            data = data.to_dict()

            password_bytes = password.encode('utf-8')

            return bcrypt.checkpw(password_bytes, data['password'])

        else:
            return False