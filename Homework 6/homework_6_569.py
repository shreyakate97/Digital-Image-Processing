Name: Shreya Kate
Homework 6
Date: 04/26/2020
email:shreyak@usc.edu

import numpy as np
import time

from keras.datasets import cifar10
from keras.utils.np_utils import to_categorical   

(X_train, y_train), (X_test, y_test) = cifar10.load_data()

X_train = X_train/255
X = X_train[0:10000,:,:,:]

nti = 50000

from skimage.util import view_as_windows
    
def n_shrink(data,shrink_arg):
    win = shrink_arg['win']
    stride = shrink_arg['stride']
    ch = data.shape[-1]
    data = view_as_windows(data, (1,win,win,ch), (1,stride,stride,ch))
    return data.reshape(data.shape[0], data.shape[1], data.shape[2], -1)

def Concat(X, concatArg):
    return X

SaabArgs = [{'num_AC_kernels':-1, 'needBias':False, 'useDC':True, 'batch':None, 'cw':False}, 
              {'num_AC_kernels':-1, 'needBias':True, 'useDC':True, 'batch':None, 'cw':True},
              {'num_AC_kernels':-1, 'needBias':True, 'useDC':True, 'batch':None, 'cw':True}]

shrinkArgs = [{'func':n_shrink, 'win':5, 'stride':2}, 
              {'func': n_shrink, 'win':5, 'stride':2},
              {'func': n_shrink, 'win':5, 'stride':2}]

concatArg = {'func':Concat}

"""Module 1"""

start = time.time()
    
    from pixelhop2 import Pixelhop2 
    output = []
    p2 = Pixelhop2(depth=3, TH1=0.001, TH2=0.0001, SaabArgs=SaabArgs, shrinkArgs=shrinkArgs, concatArg=concatArg)
    p2.fit(X)

    end = time.time()

    print('Time for Module 1:',(end-start))

import pickle
filename1 = 'phop.sav'
pickle.dump(p2, open(filename1, 'wb'))

import pickle

phop = pickle.load(open('/content/phop.sav', 'rb'))

X_train[0:nti].shape

"""# Module 2"""

start = time.time()
output = phop.transform(X_train[0:nti])
print(output[0].shape,output[1].shape,output[2].shape)


from cross_entropy import Cross_Entropy

X_reshape0 = output[0].reshape(len(output[0]), -1,output[0].shape[-1])
X_reshape1 = output[1].reshape(len(output[1]), -1,output[1].shape[-1])
X_reshape2 = output[2].reshape(len(output[2]), -1,output[2].shape[-1])

kce = Cross_Entropy(num_class=10, num_bin=5)

kce_fd0 = np.zeros(X_reshape0.shape[-1])
kce_fd1 = np.zeros(X_reshape1.shape[-1])
kce_fd2 = np.zeros(X_reshape2.shape[-1])

for k in range(X_reshape0.shape[-1]):
        kce_fd0[k] = kce.KMeans_Cross_Entropy(X_reshape0[:,:,k].reshape(X_reshape0.shape[0],-1), y_train[0:nti])
print('finished 0')

for k in range(X_reshape1.shape[-1]):
        kce_fd1[k] = kce.KMeans_Cross_Entropy(X_reshape1[:,:,k].reshape(X_reshape1.shape[0],-1), y_train[0:nti])
print('finished 1')
for k in range(X_reshape2.shape[-1]):
        kce_fd2[k] = kce.KMeans_Cross_Entropy(X_reshape2[:,:,k].reshape(X_reshape2.shape[0],-1), y_train[0:nti])
print('finished 2')  


fd0 = []
fd1 = []
fd2 = []
for k in range(X_reshape0.shape[-1]):
  fd0.append([k, kce_fd0[k]])

for k in range(X_reshape1.shape[-1]):
  fd1.append([k, kce_fd1[k]])

for k in range(X_reshape2.shape[-1]):
  fd2.append([k, kce_fd2[k]])


fd0_sorted = sorted(fd0,key=lambda x: x[1])
fd1_sorted = sorted(fd1,key=lambda x: x[1])
fd2_sorted = sorted(fd2,key=lambda x: x[1])

fd0_ns = fd0_sorted[0:round(len(fd0_sorted)/2)]
fd1_ns = fd1_sorted[0:round(len(fd1_sorted)/2)]
fd2_ns = fd2_sorted[0:round(len(fd2_sorted)/2)]



f_number0 = [i[0] for i in fd0_ns]
f_number1 = [i[0] for i in fd1_ns]
f_number2 = [i[0] for i in fd2_ns]


from lag import LAG
from llsr import LLSR as myLLSR

lag = LAG(encode='distance', num_clusters=[5,5,5,5,5,5,5,5,5,5], alpha=10, learner=myLLSR(onehot=False)) 
lag.fit(X_reshape0[:,:,f_number0].reshape(X_reshape0.shape[0],-1), y_train[0:nti])



lag1 = LAG(encode='distance', num_clusters=[5,5,5,5,5,5,5,5,5,5], alpha=10, learner=myLLSR(onehot=False)) 
lag1.fit(X_reshape1[:,:,f_number1].reshape(X_reshape1.shape[0],-1), y_train[0:nti])
lag2 = LAG(encode='distance', num_clusters=[5,5,5,5,5,5,5,5,5,5], alpha=10, learner=myLLSR(onehot=False)) 
lag2.fit(X_reshape2[:,:,f_number2].reshape(X_reshape2.shape[0],-1), y_train[0:nti])

end = time.time()
print('Module 2:',(end-start))


"""Module 3"""

start = time.time()
lag_output_0 = lag.transform(X_reshape0[:,:,f_number0].reshape(X_reshape0.shape[0],-1))
lag_output_1 = lag1.transform(X_reshape1[:,:,f_number1].reshape(X_reshape1.shape[0],-1))
lag_output_2 = lag2.transform(X_reshape2[:,:,f_number2].reshape(X_reshape2.shape[0],-1))


lag_concat = np.concatenate((lag_output_0,lag_output_1,lag_output_2),axis=1)
lag_concat.shape



from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import StratifiedKFold
import pandas as pd

clf = RandomForestClassifier(bootstrap=False , criterion= 'entropy', random_state=2,n_jobs=-1)

cv = StratifiedKFold(n_splits=5, random_state=2, shuffle=True)
results = pd.DataFrame(columns=['training_score', 'test_score'])

x = pd.DataFrame(lag_concat)
y = pd.DataFrame(y_train[0:nti])
for (train, test), i in zip(cv.split(x, y), range(5)):
    clf.fit(x.iloc[train], y.iloc[train])


end = time.time()
print('Module 3:',(end - start))

lag_concat.shape

"""RF claassifier"""

rfc_predict = clf.predict(lag_concat)

correct = 0
for i in range(len(rfc_predict)):
  if rfc_predict[i] == y_train[i][0]:
    correct+=1
print(correct/nti)

"""Testing"""

Xt = X_test/255

output_t = phop.transform(Xt)
print(output_t[0].shape,output_t[1].shape,output_t[2].shape)

X_reshape0_t = output_t[0].reshape(len(output_t[0]), -1,output_t[0].shape[-1])
X_reshape1_t = output_t[1].reshape(len(output_t[1]), -1,output_t[1].shape[-1])
X_reshape2_t = output_t[2].reshape(len(output_t[2]), -1,output_t[2].shape[-1])

lag_output_0_t = lag.transform(X_reshape0_t[:,:,f_number0].reshape(X_reshape0_t.shape[0],-1))
lag_output_1_t = lag1.transform(X_reshape1_t[:,:,f_number1].reshape(X_reshape1_t.shape[0],-1))
lag_output_2_t = lag2.transform(X_reshape2_t[:,:,f_number2].reshape(X_reshape2_t.shape[0],-1))

lag_concat_t = np.concatenate((lag_output_0_t,lag_output_1_t,lag_output_2_t),axis=1)
print(lag_concat_t.shape)


rfc_predict_t = clf.predict(lag_concat_t)

correct = 0
for i in range(len(rfc_predict_t)):
  if rfc_predict_t[i] == y_test[i][0]:
    correct+=1
print(correct/10000)

import matplotlib.pyplot as plt

plt.plot([12500, 6250, 3125, 1562], [30.63,20.24,11.16,10.74])
plt.xlabel('number of training images')
plt.ylabel('test accuracy')