from typing import List, Optional
from state.states import UserConvoState

class UserConvo:
     def __init__(
          self,
          username: Optional[str] = None,
          convoId: Optional[str] = None,
          state: Optional[UserConvoState] = None,
          stance: Optional[str] = None,
          treatment: Optional[bool] = None
     ):
          self.username = username
          self.convoId = convoId
          self.state = state
          self.stance = stance
          self.treatment = treatment

     def to_dict(self):
          return {
               'state': self.state.value,
               'stance': self.stance,
               'treatment': self.treatment
          }
     
