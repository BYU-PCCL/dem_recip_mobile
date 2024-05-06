from typing import List, Optional
from datetime import datetime

class Message:
    def __init__(
        self,
        origText: Optional[str] = None,
        finalText: Optional[str] = None,
        topic: Optional[str] = None,
        body: Optional[str] = None,
        visible: Optional[str] = None,
        position: Optional[int] = None,
        sendTime: Optional[datetime] = None,
        senderId: Optional[str] = None,
        msgNum: Optional[int] = None,
        turnNum: Optional[int] = None,
        alternatives: Optional[list] = None
    ):
     self.origText = origText
     self.finalText = finalText
     self.topic = topic
     self.body = body
     self.visible = visible
     self.position = position
     self.sendTime = sendTime
     self.senderId = senderId
     self.msgNum = msgNum
     self.turnNum = turnNum
     self.alternatives = alternatives