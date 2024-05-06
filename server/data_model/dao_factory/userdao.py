from abc import ABC, abstractmethod
from typing import Union
from ..dto.user import User
from ..dto.conversation import Conversation
from .convodao import ConvoDao

class UserDao(ABC):

    @abstractmethod
    def get_user(self, username: str) -> Union[User, None]:
        pass

    @abstractmethod
    def update_user(self, username: str, data: dict[str, any]):
        pass

    @abstractmethod
    def get_conversations(self, username: str, convodao: ConvoDao) -> list[Conversation]:
        pass

    @abstractmethod
    def delete_conversation(self, username: str, convo_id: str):
        pass

    @abstractmethod
    def validate_username_password(self, token: str) -> tuple[bool, str]:
        pass