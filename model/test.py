from fastai.vision import *
from fastai.metrics import error_rate
from pathlib import Path

																																																																																																																																																				learn = load_learner(path)
																																																																																																																																																				test_img_path = 'data/test/cardboard1.jpg'
																																																																																																																																																				im = open_image(test_img_path)
																																																																																																																																																																																																																										pred_class,pred_idx,outputs = learn.predict(im)																																				
																																																																																																																																																				print (pred_class, pred_idx, outputs)
