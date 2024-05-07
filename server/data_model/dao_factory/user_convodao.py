
from abc import ABC, abstractmethod
from ..dto.message import Message
from ..dto.user import User
from ..dto.conversation import Conversation
from ..dto.userconvo import UserConvo
from state.states import UserConvoState
from typing import Optional

class UserConvoDao(ABC):
    
    @abstractmethod
    def get_state(self, username: str, convo_id: str) -> UserConvoState:
        pass

    @abstractmethod
    def set_state(self, username: str, convo_id: str, state: UserConvoState):
        pass
    
    @abstractmethod
    def create(self, data: UserConvo) -> bool:
        pass
    