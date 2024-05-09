from data_model.dao_factory.convodao import ConvoDao, Conversation
import uuid
from datetime import datetime

class ConvoService:
     def __init__(self, convodao: ConvoDao) -> None:
          self.convodao = convodao

     def create(self, data: dict[str, str], waiting_id: str) -> tuple[str, bool]:
          if not waiting_id:
               convoId = str(uuid.uuid4())
               participants = [data['participant1'], data['participant2']]
          else:
               convoId = waiting_id
               participants = None
          timestamp = int(datetime.now().timestamp())

          user_convo = Conversation(
               convoId=convoId,
               timestamp=timestamp,
               participatnts=participants,
               topic=data['topic'],
          )
          
          created = self.convodao.create_convo(user_convo)

          return (convoId, created)

    
    