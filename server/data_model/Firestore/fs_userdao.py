from data_model.dto.conversation import Conversation
from ..dto.user import User
from ..dao_factory.userdao import UserDao
from ..dao_factory.convodao import ConvoDao
from .db import Firebase

from typing import Union

class FirebaseUserDao(UserDao):
    
    db, auth = Firebase()
    
    def get_user(self, username: str) -> Union[User, None]:
        doc_ref = self.db.collection("user").document(username)

        data = doc_ref.get()

        if data and data.exists:
            formatted_data = data.to_dict()
            return User(
                gender=formatted_data.get('gender'),
                race=formatted_data.get('race'),
                partisanship=formatted_data.get('partisanship'),
                yearBorn=formatted_data.get('yearBorn'),
                conversations=formatted_data.get('conversations'),
                isBot=formatted_data.get('isBot'),
                interceptId=formatted_data.get('interceptId')
            )
        return None
    
    def update_user(self, username: str, data: dict[str, any]):
        doc_ref = self.db.collection("user").document(username)
        if doc_ref.get().exists:
            doc_ref.update(data)
        else:
            doc_ref.create(data)
    
    def get_conversations(self, username: str, convodao: ConvoDao) -> list[Conversation]:
        doc_ref = self.db.collection("user").document(username)
        data = doc_ref.get()
        if data and data.exists:
            formatted_data = data.to_dict()
            conversation_ids: list[str] = formatted_data.get('conversations', [])
            convos = [convodao.get_convo(convo_id) for convo_id in conversation_ids]
            return convos
        else:
            raise Exception("Could not find user in database")
    
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