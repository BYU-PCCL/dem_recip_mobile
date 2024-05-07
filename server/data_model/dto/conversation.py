from typing import Optional

class Conversation:
     def __init__(
          self,
          convoId: Optional[str] = None,
          messageSemaphore: Optional[bool] = None,
          topic: Optional[str] = None,
          participatnts: Optional[list[str]] = None,
          messages: Optional[list[str]] = None
     ):
          self.convoId = convoId
          self.messageSemaphore = messageSemaphore
          self.topic = topic
          self.participatnts = participatnts
          self.messages = messages

     def to_dict(self):
          return {
               'convoId': self.convoId,
               'messageSemaphore': self.messageSemaphore,
               'topic': self.topic,
               'participatnts': self.participatnts,
               'messages': self.messages,
          }
