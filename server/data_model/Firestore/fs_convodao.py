from data_model.dto.conversation import Conversation
from data_model.dto.message import Message
from ..dto.user import User
from ..dao_factory.convodao import ConvoDao
from .db import Firebase


class FirebaseConvoDao(ConvoDao):
    
     db, auth = Firebase()

     def get_convo(self, convo_id: str) -> Conversation:
          doc_ref = self.db.collection("conversation").document(convo_id)
          data = doc_ref.get()

          if data and data.exists:
               formatted_data = data.to_dict()
               return Conversation(
                    convoId=convo_id,
                    messages=formatted_data.get('messages'),
                    topic=formatted_data.get('topic'),
                    participatnts=formatted_data.get('participants'),
                    messageSemaphore=formatted_data.get('messageSemaphore'),
               )
          else:
               raise Exception("Conversation does not exist")

     def get_messages(self, convo_id: str) -> list[Message]:
          return super().get_messages(convo_id)

     def add_message(self, username: str, convo_id: str, msg: str):
          return super().add_message(username, convo_id, msg)

     def get_participants(self, convo_id: str) -> list[User]:
          return super().get_participants(convo_id)
     
     def get_topic(self, convo_id: str) -> str:
          return super().get_topic(convo_id)
     
     def create_convo(self, convo: Conversation):
          
          doc_ref = self.db.collection("conversation").document(convo.convoId)

          doc_ref.create(convo.to_dict())