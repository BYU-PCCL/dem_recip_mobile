from abc import ABC, abstractmethod
from typing import Union


class UserDao(ABC):

    @abstractmethod
    def get_user(self, username: str):
        pass

    @abstractmethod
    def update_user(self, username: str, data: dict[str, any]):
        pass

    @abstractmethod
    def get_conversations(self, username):
        pass

    @abstractmethod
    def delete_conversation(self, username, convo_id):
        pass

    @abstractmethod
    def validate_username_password(self, token: str) -> tuple[bool, str]:
        pass