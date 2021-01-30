import os
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app

app = Flask(__name__)
cred = credentials.Certificate('garbify_key.json')
default_app = initialize_app(cred)
db = firestore.client()



