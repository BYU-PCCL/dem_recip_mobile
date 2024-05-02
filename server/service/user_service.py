from data_model.dao_factory.userdao import UserDao
from data_model.dto.user import User
from typing import Union

class UserService:
    def __init__(self, user_dao: UserDao) -> None:
        self.user_dao = user_dao
    
    def signup_user(self, user: User, password: str, data: dict[str, str]) -> bool:
        
        return self.user_dao.create_user(user, password, data)
    
    def get_user(self, username: str) -> Union[User, None]:

        return self.user_dao.get_user(username)
    
    def validate(self, username: str, password: str) -> bool:
        
        return self.user_dao.validate_username_password(username, password)