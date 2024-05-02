from abc import ABC, abstractmethod
from ..Firestore.fs_user_dao import FirebaseUserDao, UserDao


class FactoryProvider:
    
    @staticmethod
    def getFactory() -> 'DaoFactory':
        return FirestoreFactory()


class DaoFactory(ABC):
    
    @abstractmethod
    def get_user_dao(self) -> UserDao:
        pass

class FirestoreFactory(DaoFactory):
    
    def get_user_dao(self) -> UserDao:
        return FirebaseUserDao()