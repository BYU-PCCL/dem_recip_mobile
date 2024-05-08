from abc import ABC, abstractmethod
from ..Firestore.fs_userdao import FirebaseUserDao, UserDao
from ..Firestore.fs_convodao import FirebaseConvoDao, ConvoDao
from ..Firestore.fs_userconvo import FirebaseUserConvoDao, UserConvoDao
from ..Firestore.fs_questiondao import FirebaseQuesionDao, QuestionDao
from ..Firestore.fs_interceptdao import FirebaseInterceptDao, InterceptDao


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

    @abstractmethod
    def get_user_convodao(self) -> UserConvoDao:
        pass
    
    @abstractmethod
    def get_questiondao(self) -> QuestionDao:
        pass
    
    @abstractmethod
    def get_interceptdao(self) -> InterceptDao:
        pass

class FirestoreFactory(DaoFactory):
    
    def get_userdao(self) -> UserDao:
        return FirebaseUserDao()
    
    def get_convodao(self) -> ConvoDao:
        return FirebaseConvoDao()
    
    def get_user_convodao(self) -> UserConvoDao:
        return FirebaseUserConvoDao()
    
    def get_questiondao(self) -> QuestionDao:
        return FirebaseQuesionDao()
    
    def get_interceptdao(self) -> InterceptDao:
        return FirebaseInterceptDao()