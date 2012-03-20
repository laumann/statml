README
======

This is the README for the hand-in for assignment 3 in Statistical Methods for Machine Learning.

About the code
--------------
All code is implemented in MATLAB. 

Neural Network
--------------
Run nntrain.m, which 
* creates weight matrices representing eight neural networks, 
* trains them for 25000 batch learning iterations,
* measures the error to training and test sets every 50 iterations,
* plots the solutions and the error trajectories.

The eight neural networks are:
* four with a hidden layer of 20 neurons, 
* four with two hidden neurons.

Both groups of neural networks feature a training with learning rates of
* 0.001,
* 0.0001,
* 0.00001 and
* 0.000001.

After running nntrain, these eight weight matrices can be found in WsCells and the error rates in ErrVecTrain and ErrVecTest.

Each major step involves supporting functions. Sometimes alternatives exist. For example, instead of using the function initWsRandNoShortcuts(...) to produce an initial weight matrix without short cuts, initWsRand(...) can be used to get a neural network with short cuts.



Support Vector Machines
-----------------------
The implementation of the SVM exercise depends on the current version of the LIBSVM Matlab interface being compiled and available in Matlab. It will not run correctly if Matlab picks its own builtin function svmtrain instead. 
Run runsvm.m to start all calculations concerning the SVM exercise. It will print all results of the model selection and kernel inspection tasks to the console. The plot of bounded and unbounded support vectors will be saved as freeBoundesSVs.eps in the current directory. 
Subtasks like the model selection (modelselect.m) and the calculation of bounded and free support vectors (dividesupportvectors.m) have been saved in separate functions and should be self-explanatory.

Authors
-------
Philip Pickering <pgpick@gmx.at>
Marco Eilers <eilers.marco@googlemail.com>
Thomas Bracht Laumann Jespersen <laumann.thomas@gmail.com>
