from enum import Enum

class UserState(Enum):
     QUESTIONNAIRE=1
     NORMAL=2

class UserConvoState(Enum):
     IN_CONVO=1
     IN_INTERVENTION=2
     IN_QUESTIONNAIRE=3