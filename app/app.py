import os
from flask import Flask, request, jsonify
#from fastai.basic_train import load_learner
#from fastai.vision import open_image
import matplotlib.pyplot as plt
import numpy as np
import torch
from torch import nn
from torch import optim
import torch.nn.functional as F
from torchvision import datasets, transforms, models

import zipfile as zf
files = zf.ZipFile("dataset.zip",'r')
files.extractall()
files.close()

data_dir = 'dataset'
test_transforms = transforms.Compose([transforms.Resize(224), transforms.ToTensor(), ])

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model=torch.load('model.pth')
model.eval()

app = Flask(__name__)
cred = credentials.Certificate('garbify_key.json')
default_app = initialize_app(cred)
db = firestore.client()
scores_ref = db.collection('scores')
# I think we should just import the fastai pkl file here and do it within the method.
# we can always get the image that we want to predict on from Firebase cloud storage

learn = load_learner(path='./models', file='model.pth')

classes = learn.data.classes



def predict_image(image):
    image_tensor = test_transforms(image).float()
    image_tensor = image_tensor.unsqueeze_(0)
    # input = Variable(image_tensor)
    input = image_tensor
    input = input.to(device)
    output = model(input)
    index = output.data.cpu().numpy().argmax()
    print(output.data.cpu().numpy())
    return {'pred': index}
'''
def predict_single(img_file):
    prediction = learn.predict(open_image(img_file))
    probs_list = prediction[2].numpy()
    return {
        'category': classes[prediction[1].item()]
       }
    }
'''
### modify the code above to fit only result 2 options TRASH or RECYCLE

@app.route('/home',methods=["POST"])
def create_user_score():
    try:
        # json needs to have {'id': username 'score': 0}
        uid =request.json['id']
        scores_ref.document(uid).set(request.json)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"Exception occured at: {e}"
@app.route('/home',methods=["POST", "PUT"])
def update_user_score():
    try:
        uid = request.json['id']
        scores_ref.document(uid).update(request.json)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"Exception occured at: {e}"
@app.route('/home',methods=["GET"])
def get_user_score():
    try:
        uid = request.args.get('id')
        user_prof = scores_ref.document(uid).get()
        return jsonify(user_prof.to_dict()), 200
    except Exception as e:
        return f"Exception occured at: {e}"

@app.route('/leaderboard',methods=['GET'])
def get_leaderboard():
    try:
        all_users = [user.to_dict() for user in scores_ref.stream()]
        return jsonify(all_users), 200
    except Exception as e:
        return f"Exception occured at: {e}"

@app.route('/camera',methods=['POST'])
def predict():
    # not the actual code need to figure out how to serve the image
    # that was taken and put into firebase/cloud storage?
    # into flask

    return jsonify(predict_image(request.files['image']))

port = int(os.environ.get('PORT', 8080))
if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=port)
                   



        
