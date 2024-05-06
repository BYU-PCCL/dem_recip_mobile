from data_model.dao_factory.convodao import ConvoDao, Conversation

class ConvoService:
     def __init__(self, convodao: ConvoDao) -> None:
          self.convodao = convodao

     def create(self, data: dict[str, str]):
          user_convo = Conversation(
               convoId=data['convoId'],
               topic=data['topic']
          )
          
          self.convodao.create_convo(user_convo)

    
    