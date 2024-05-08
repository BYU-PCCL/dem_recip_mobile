from typing import List, Optional

class Question:
     def __init__(
          self,
          username: str,
          timestamp: str,
          desc: Optional[str] = None,
          answer: Optional[str] = None,
     ):
          self.username = username
          self.timestamp = timestamp
          self.desc = desc
          self.answer = answer

     def to_dict(self):
          return {
               "desc": self.desc,
               "answer": self.answer
          }
     
     @staticmethod
     def toQuestion(username: str, desc: str, data: dict[str, str]) -> 'Question':
          return Question(
               username=username,
               timestamp=data['timestamp'],
               desc=desc,
               answer=data['answer']
          )