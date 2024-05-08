from abc import ABC, abstractmethod
from ..dto.userconvo import UserConvo
from state.states import UserConvoState

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

    @abstractmethod
    def update(self, data: UserConvo, data_to_update: dict[str, any]) -> bool:
        pass
    