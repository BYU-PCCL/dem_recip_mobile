from data_model.dao_factory.user_convodao import UserConvoDao, UserConvo
from data_model.dao_factory.questiondao import QuestionDao, Question
from state.states import UserConvoState

class UserConvoService:
     def __init__(self, user_convodao: UserConvoDao) -> None:
          self.user_convodao = user_convodao

     def update(self, user_convo: UserConvo, data_to_update: dict[str, any]):
          
          self.user_convodao.update(user_convo, data_to_update)
     
     def get_state(self, username: str, convo_id: str) -> UserConvoState:
          pass

     def set_state(self, username: str, convo_id: str, state: UserConvoState):
          pass

     def create(self, data: dict[str, str], questiondao: QuestionDao) -> bool:
          user_convo = UserConvo(
               username=data['username'],
               convoId=data['convoId'],
               state=UserConvoState.IN_CONVO,
               treatment= True if data['treatment'] == "true" else False
          )

          created = self.user_convodao.create(user_convo)
          
          if created:

               questions = []
               
               for q, q_data in data['questions'].items():
                    question1 = Question.toQuestion(data['username'], q, q_data)
                    pk = questiondao.create(question1)
                    questions.append(pk)
               
               if questions:
                    self.update(user_convo, {'questions': questions})
          
          return created
          

    
    