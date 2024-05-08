from data_model.dto.intercept import Intercept
from data_model.dto.userconvo import UserConvo
from state.states import UserConvoState
from ..dao_factory.interceptdao import InterceptDao
from .db import Firebase


class FirebaseInterceptDao(InterceptDao):
     db, auth = Firebase()

     def create(self, intercept: Intercept):
          pk = f"{intercept.username}-{intercept.convoId}"

          doc_ref = self.db.collection("conversation").document(pk)

          doc_ref.create(intercept.to_dict())

     def increment(self, intercept: Intercept, key: str):
          pk = f"{intercept.username}-{intercept.convoId}"

          doc_ref = self.db.collection("conversation").document(pk)

          data = doc_ref.get()

          cur_num = int(data.get(key))

          doc_ref.update({key: cur_num + 1})




