# Project Garbage Classifier (Working Title):


## Basic Features:
Create a mobile application using React Native (or Flutter etc. some kind of mobile framework), Firebase backend, and fastai image classification model to detect and classify garbage from user taken photos
into either: recycling, compost, landfill (, maybe e-Waste?).


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
- https://dev.to/mdabrowskieu/building-rest-api-in-python-with-starlette-and-docker-10n2
- https://medium.com/usf-msds/creating-a-web-application-powered-by-a-fastai-model-d5ee560d5207
- https://towardsdatascience.com/building-a-movie-genre-classifier-using-a-dataset-created-using-google-images-4752f75a1d79
- https://github.com/pedropro/TACO
- https://github.com/garythung/trashnet/
- ~~https://reactnative.dev/~~
- https://flutter.dev/
