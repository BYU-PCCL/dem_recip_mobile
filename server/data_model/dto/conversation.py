from typing import List, Optional

class Conversation:
    def __init__(
        self,
        convoId: Optional[str] = None,
        messagesSemaphore: Optional[bool] = None,
        topic: Optional[str] = None,
        participatnts: Optional[list[str]] = None,
        messages: Optional[list[str]] = None
    ):
     self.convoId = convoId
     self.messagesSemaphore = messagesSemaphore
     self.topic = topic
     self.participatnts = participatnts
     self.messages = messages