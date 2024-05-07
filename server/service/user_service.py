from data_model.dao_factory.userdao import UserDao
from data_model.dao_factory.convodao import ConvoDao, Conversation
from data_model.dto.user import User
from typing import Union

class UserService:
    def __init__(self, userdao: UserDao) -> None:
        self.userdao = userdao
    
    def get_user(self, username: str) -> Union[User, None]:

        return self.userdao.get_user(username)
    
    def validate(self, token: str) -> tuple[bool, str]:
        
        return self.userdao.validate_username_password(token)
    
    def update_user(self, username: str, data: dict[str, any]):

        return self.userdao.update_user(username, data)
    
    def get_conversations(self, username: str, convodao: ConvoDao) -> list[Conversation]:

        return self.userdao.get_conversations(username, convodao)
    
    def add_conversation(self, username: str, convo_id: str):

        user = self.userdao.get_user(username)

        convos = user.conversations if user.conversations else []

        new_arr = convos + [convo_id]

        self.userdao.update_user(username, {'conversations': new_arr})
