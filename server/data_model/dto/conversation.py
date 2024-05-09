from typing import Optional

class Conversation:
     def __init__(
          self,
          convoId: str,
          timestamp: int,
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
          self.timestamp = timestamp

     def to_dict(self):
          return {
               'convoId': self.convoId,
               'messageSemaphore': self.messageSemaphore,
               'topic': self.topic,
               'participants': self.participatnts,
               'messages': self.messages,
               'timestamp': self.timestamp
          }
