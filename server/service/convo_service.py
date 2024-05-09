from data_model.dao_factory.convodao import ConvoDao, Conversation
import uuid
from datetime import datetime

class ConvoService:
     def __init__(self, convodao: ConvoDao) -> None:
          self.convodao = convodao

     def create(self, data: dict[str, str]) -> str:
          convoId = str(uuid.uuid4())
          timestamp = int(datetime.now().timestamp())

          user_convo = Conversation(
               convoId=convoId,
               timestamp=timestamp,
               participatnts=[data['participant1'], data['participant2']],
               topic=data['topic'],
          )
          
          self.convodao.create_convo(user_convo)

          return convoId

    
    