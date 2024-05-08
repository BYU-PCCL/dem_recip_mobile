from abc import ABC, abstractmethod

from ..dto.question import Question

class QuestionDao(ABC):
    
     @abstractmethod
     def create(self, question: Question) -> str:
          pass