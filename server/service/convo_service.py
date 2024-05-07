from data_model.dao_factory.convodao import ConvoDao, Conversation
import uuid

class ConvoService:
     def __init__(self, convodao: ConvoDao) -> None:
          self.convodao = convodao

     def create(self, data: dict[str, str]) -> str:
          convoId = str(uuid.uuid4())

          user_convo = Conversation(
               convoId=convoId,
               topic=data['topic']
          )
          
          self.convodao.create_convo(user_convo)

          return convoId

    
    