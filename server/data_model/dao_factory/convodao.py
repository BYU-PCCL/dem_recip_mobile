from abc import ABC, abstractmethod
from ..dto.message import Message
from ..dto.user import User
from ..dto.conversation import Conversation
from typing import Optional

class ConvoDao(ABC):
    
    @abstractmethod
    def get_convo(self, convo_id: str) -> Conversation:
        pass

    @abstractmethod
    def get_messages(self, convo_id: str) -> list[Message]:
        pass
    
    @abstractmethod
    def add_message(self, username: str, convo_id: str, msg: str):
        pass
    
    @abstractmethod
    def get_participants(self, convo_id: str) -> list[User]:
        pass
    
    @abstractmethod
    def get_topic(self, convo_id: str) -> str:
        pass