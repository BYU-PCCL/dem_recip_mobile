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
     self.messagesSemaphore = messageSemaphore
     self.topic = topic
     self.participatnts = participatnts
     self.messages = messages