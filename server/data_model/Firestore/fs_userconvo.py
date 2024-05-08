from data_model.dto.userconvo import UserConvo
from state.states import UserConvoState
from ..dao_factory.user_convodao import UserConvoDao
from .db import Firebase


class FirebaseUserConvoDao(UserConvoDao):
    
    db, auth = Firebase()

    def create(self, data: UserConvo) -> bool:
        pk = f"{data.username}-{data.convoId}"
        doc_ref = self.db.collection("userconvo").document(pk)

        db_data = doc_ref.get()
        if db_data and db_data.exists:
            return False
        else:
            doc_ref.create(data.to_dict())
            return True
    
    def update(self, data: UserConvo, data_to_update: dict[str, any]) -> bool:
        pk = f"{data.username}-{data.convoId}"
        doc_ref = self.db.collection("userconvo").document(pk)

        doc_ref.update(data_to_update)
    
    def get_state(self, username: str, convo_id: str) -> UserConvoState:
        return super().get_state(username, convo_id)
    
    def set_state(self, username: str, convo_id: str, state: UserConvoState):
        return super().set_state(username, convo_id, state)