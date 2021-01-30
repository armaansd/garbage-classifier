import os
from flask import Flask, request, jsonify
from fastai.basic_train import load_learner
from fastai.vision import open_image
from firebase_admin import credentials, firestore, initialize_app

app = Flask(__name__)
cred = credentials.Certificate('garbify_key.json')
default_app = initialize_app(cred)
db = firestore.client()
scores_ref = db.collection('scores')
# I think we should just import the fastai pkl file here and do it within the method.
# we can always get the image that we want to predict on from Firebase cloud storage

#learn = load_learner(path='./models', file='garb_trained.pkl')

#classes = learn.data.classes


def predict_single(img_file):
    prediction = learn.predict(open_image(img_file))
    probs_list = prediction[2].numpy()
    return {
        'category': classes[prediction[1].item()],
        'probs': {c: round(float(probs_list[i]), 5) for (i, c) in enumerate(classes)}
    }

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
        uid = request.json['id']
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
    return jsonify(predict_single(request.files['image'])
        
    

port = int(os.environ.get('PORT', 8080))
if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=port)
