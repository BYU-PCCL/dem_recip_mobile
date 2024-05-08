from typing import Optional

class Intercept:
     def __init__(
          self,
          convoId: str,
          username: str,
          alternative: Optional[int] = 0,
          original: Optional[int] = 0,
          total: Optional[int] = 0,
     ):
          self.convoId = convoId,
          self.username = username,
          self.alternative = alternative,
          self.original = original,
          self.total = total

     def to_dict(self):
          return {
               "alternative": self.alternative,
               "original": self.original,
               "total": self.total
          }