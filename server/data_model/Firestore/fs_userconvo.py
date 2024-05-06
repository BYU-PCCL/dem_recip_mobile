from data_model.dto.userconvo import UserConvo
from state.states import UserConvoState
from ..dao_factory.user_convodao import UserConvoDao
from .db import Firebase


class FirebaseUserConvoDao(UserConvoDao):
    
    db, auth = Firebase()

    def create(self, data: UserConvo):
        composite_key = data.username + data.convoId
        doc_ref = self.db.collection("userconvo").document(composite_key)

        doc_ref.create(data.to_dict())
    
    def get_state(self, username: str, convo_id: str) -> UserConvoState:
        return super().get_state(username, convo_id)
    
    def set_state(self, username: str, convo_id: str, state: UserConvoState):
        return super().set_state(username, convo_id, state)