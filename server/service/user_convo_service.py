from data_model.dao_factory.user_convodao import UserConvoDao, UserConvo
from state.states import UserConvoState

class UserConvoService:
     def __init__(self, user_convodao: UserConvoDao) -> None:
          self.user_convodao = user_convodao
     
     def get_state(self, username: str, convo_id: str) -> UserConvoState:
          pass

     def set_state(self, username: str, convo_id: str, state: UserConvoState):
          pass

     def create(self, data: dict[str, str]):
          user_convo = UserConvo(
               data['username'],
               data['convoId'],
               UserConvoState.IN_CONVO,
               data['stance'],
               data['treatment']
          )
          self.user_convodao.create(user_convo)

    
    