from abc import ABC, abstractmethod
from ..Firestore.fs_userdao import FirebaseUserDao, UserDao
from ..Firestore.fs_convodao import FirebaseConvoDao, ConvoDao


class FactoryProvider:
    
    @staticmethod
    def getFactory() -> 'DaoFactory':
        return FirestoreFactory()


class DaoFactory(ABC):
    
    @abstractmethod
    def get_userdao(self) -> UserDao:
        pass

    @abstractmethod
    def get_convodao(self) -> ConvoDao:
        pass

class FirestoreFactory(DaoFactory):
    
    def get_userdao(self) -> UserDao:
        return FirebaseUserDao()
    
    def get_convodao(self) -> ConvoDao:
        return FirebaseConvoDao()