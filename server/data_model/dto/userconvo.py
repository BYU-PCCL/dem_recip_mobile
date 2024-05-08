from typing import List, Optional
from state.states import UserConvoState

class UserConvo:
     def __init__(
          self,
          username: str,
          convoId: str,
          treatment: bool,
          state: UserConvoState,
          questions: Optional[list[str]] = None
     ):
          self.username = username
          self.convoId = convoId
          self.state = state
          self.treatment = treatment
          self.questions = questions
     def to_dict(self):
          return {
               'state': self.state.value,
               'treatment': self.treatment,
               'questions': self.questions
          }
     
