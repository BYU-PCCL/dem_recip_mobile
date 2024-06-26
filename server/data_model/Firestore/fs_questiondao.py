from data_model.dto.question import Question
from ..dao_factory.questiondao import QuestionDao
from .db import Firebase


class FirebaseQuesionDao(QuestionDao):
     db, auth = Firebase()
     
     def create(self, question: Question) -> str:

          pk = f"{question.username}-{question.timestamp}"

          doc_ref = self.db.collection("question").document(pk)

          doc_ref.create(question.to_dict())

          return pk

