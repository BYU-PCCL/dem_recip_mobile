from data_model.dao_factory.user_convodao import UserConvoDao, UserConvo
from data_model.dao_factory.questiondao import QuestionDao, Question
from state.states import UserConvoState

class UserConvoService:
     def __init__(self, user_convodao: UserConvoDao) -> None:
          self.user_convodao = user_convodao
     
     def get_state(self, username: str, convo_id: str) -> UserConvoState:
          pass

     def set_state(self, username: str, convo_id: str, state: UserConvoState):
          pass

     def create(self, data: dict[str, str], questiondao: QuestionDao) -> bool:
          user_convo = UserConvo(
               data['username'],
               data['convoId'],
               UserConvoState.IN_CONVO,
               data['treatment']
          )

          created = self.user_convodao.create(user_convo)
          
          if created:
               for q, q_data in data['questions'].items():
                    question1 = Question.toQuestion(data['username'], q, q_data)
                    questiondao.create(question1)
          
          return created
          

    
    