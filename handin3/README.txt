README
======

This is the README for the hand-in for assignment 3 in Statistical Methods for Machine Learning.

About the code
--------------
All code is implemented in MATLAB. 

Neural Network
----------
TODO


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
