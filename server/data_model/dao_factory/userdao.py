from abc import ABC, abstractmethod
from ..dto.user import User
from typing import Union


class UserDao(ABC):
    @abstractmethod
    def create_user(self, user: User, password: str, data: dict[str, str]) -> bool:
        pass

    @abstractmethod
    def get_user(self, username: str):
        pass

    @abstractmethod
    def update_user(self, username: str, field_name: str, value: Union[str, int]):
        pass

    @abstractmethod
    def get_conversations(self, username):
        pass

    @abstractmethod
    def delete_conversation(self, username, convo_id):
        pass

    @abstractmethod
    def validate_username_password(self, username: str, password: str) -> bool:
        pass