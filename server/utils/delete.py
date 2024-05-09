from firebase_admin import firestore, initialize_app, credentials, auth
import os
import json

from dotenv import load_dotenv

env_path = os.path.join(os.path.dirname(__file__), '../.env')
load_dotenv(dotenv_path=env_path)


fb_admin_struct = json.loads(os.environ['FIREBASE_AUTH'], strict=False)
cred = credentials.Certificate(fb_admin_struct)
initialize_app(cred)

db = firestore.client()

def delete_collection(coll_ref, batch_size=500):
    docs = coll_ref.limit(batch_size).stream()
    deleted = 0

    for doc in docs:
        print(f'Deleting doc {doc.id} => {doc.to_dict()}')
        doc.reference.delete()
        deleted += 1

    if deleted >= batch_size:
        return delete_collection(coll_ref, batch_size)

def delete_all_collections():
    collections = db.collections()
    for coll in collections:
        delete_collection(coll)

confirm = input("Are you sure you want to delete everythin? (y/n)")

if confirm == "y":
     delete_all_collections()