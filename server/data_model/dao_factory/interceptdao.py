from abc import ABC, abstractmethod

from ..dto.intercept import Intercept

class InterceptDao(ABC):
    
     @abstractmethod
     def create(self, intercept: Intercept):
          pass

     @abstractmethod
     def increment(self, intercept: Intercept, key: str):
          pass