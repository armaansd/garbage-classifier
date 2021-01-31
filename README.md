# Project Garbage Classifier (Working Title):


## Basic Features:
Create a mobile application using React Native (or Flutter etc. some kind of mobile framework), Firebase backend, and fastai image classification model to detect and classify garbage from user taken photos
into either: recycling, compost, landfill (, maybe e-Waste?).
**API Endpoint** 
https://quickstart-image-rvoiadg33q-uc.a.run.app

**Feature priority levels in order of importance 
1 is most important 4 is least important**

## Additional Features:
1. ML model classifies the image, doesn't tell the user but stores the knowledge.
	 Then a trivia style overlay can popup with choices for the user to decide whether the item belongs in recycling, compost, or landfill(, maybe e-Waste?).
	 This gives the user 500 points (arbitrary number can change later)
	 Points are added to users total score and whoever has the highest score is placed on a global leaderboard
2. User can take another picture of a trashcan (probably need a basic trashbin classification model as well)
	 which will confirm that they have thrown away the piece of trash, giving them +500 more points.
	 The leaderboard can also be local instead of global.
3. If the user has a global leaderboard status above a certain threshold (for example top 500 in the world) then they can report incorrect predictions of the ML model
	(underneath the normal popup there will be a button to report an inaccuracy which will only be available for these top players)
	 and correct the model and improve its accuracy.
4. Have a virtual "Prize" system so that the user can buy virtual stuff like maybe cryptocurrency with their points.

## Technologies and Languages (Tentative)
### Languages
- Javascript
- Python
- Java
- Dart

### Technologies
- fastai
- pytorch
- Flask
- ~~React Native~~
- Flutter
- Starlette
- ~~GCP~~

## Useful links
- ~~https://towardsdatascience.com/10-minutes-to-deploying-a-deep-learning-model-on-google-cloud-platform-13fa56a266ee~~
- ~~https://towardsdatascience.com/how-to-build-an-image-classifier-for-waste-sorting-6d11d3c9c478~~
### General Backend API (flask) Info:
- https://medium.com/google-cloud/building-a-flask-python-crud-api-with-cloud-firestore-firebase-and-deploying-on-cloud-run-29a10c502877
- https://medium.com/usf-msds/creating-a-web-application-powered-by-a-fastai-model-d5ee560d5207
- https://fullstackgcp.com/deploy-serverless-container-google-cloud-run-68d716af7716
- https://fullstackgcp.com/simplified-continuous-deployment-on-google-cloud-platform-bc5b0a025c4e
### ML Specific:
- https://towardsdatascience.com/how-to-build-an-image-classifier-for-waste-sorting-6d11d3c9c478
- https://towardsdatascience.com/building-a-movie-genre-classifier-using-a-dataset-created-using-google-images-4752f75a1d79
- https://github.com/pedropro/TACO
- https://github.com/garythung/trashnet/
- https://github.com/collindching/Waste-Sorter
- ~~https://reactnative.dev/~~
### Technology documentation and tutorials
- https://flutter.dev/
- https://firebase.flutter.dev/docs/firestore/usage/
- https://cloud.google.com/endpoints/docs/frameworks/python/test-deploy
- https://medium.com/codeduck/cloud-run-vs-app-engine-dc1871abedca
- https://firebase.google.com/docs/firestore/query-data/order-limit-data
### Flutter specific
- https://medium.com/flutter-community/working-with-apis-in-flutter-8745968103e9
- https://firebase.flutter.dev/docs/auth/usage/
- https://firebase.flutter.dev/docs/storage/usage/
