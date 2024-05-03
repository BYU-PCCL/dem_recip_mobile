from data_model.dao_factory.userdao import UserDao
from data_model.dto.user import User
from typing import Union

class UserService:
    def __init__(self, user_dao: UserDao) -> None:
        self.user_dao = user_dao
    
    def get_user(self, username: str) -> Union[User, None]:

        return self.user_dao.get_user(username)
    
    def validate(self, token: str) -> tuple[bool, str]:
        
        return self.user_dao.validate_username_password(token)
    
    def update_user(self, username: str, data: dict[str, any]):

        return self.user_dao.update_user(username, data)