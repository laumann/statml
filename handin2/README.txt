README
======

This is the README for the hand-in for assignment 2 in Statistical Methods for Machine Learning.

About the code
--------------
The code is implemented in MATLAB (although it might run in Octave version > 3.4). 

Regression
----------
The file 'regression.m' contains all the programmatic solutions for part 1 of the assignment. Running the file yields results for the maximum likelihood estimate of the parameters and the root mean square solutions for both selections. It also plots and saves figures demonstrating the root mean square values of the MAP estimate as a function of alpha along with the ML solution.

regression.m depends on the following files:
	- regstart.m
	- mapestimate.m
	- readbodyfat.m

Linear Discriminant Analysis
----------------------------
The file 'visknoll.m' visualises all three training sets for the Knoll problems. 
The files 'ldaKnollA.m', 'ldaKnollB.m' and 'ldaKnollC.m' perform LDA on one of the Knoll problems, respectively. They each print the means of the resulting gaussian distributions as well as the commom covariance matrix, plot and save both the training and the test data along with the decision boundary that results from the LDA. They then calculate and output the percentage of falsely classified data points and the geometric margins.

visknoll.m depends on the following files:
	- loadknoll.m
	- knollplot.m
	- dividedataset.m

The ldaKnollX.m files each depend on:
	- loadknoll.m
	- lda.m
	- getdecisionbound.m
	- plotdecisionbound.m
	- ldaerror.m
	- ldadiscrimination.m
	- dividedataset.m

k-Nearest Neighbour
-------------------
The primary file in the k-NN solution is the 'useknn.m'. It primarily runs and outputs results for k-NN for all of the knoll problems for different values of k. It also plots and saves a visualisation of the knollC test set when using the d metric. It depends on the following files:
	- loadknoll.m
	- knn.m
	- knntest.m
	- knntestrun.m

The k-NN computation is implemented in 'knn.m' and takes as input (among other things) a distance (metric) function. The two metrics we're concerned with are implemented in 'eudist.m' and 'dmetr.m'

Authors
-------
Philip Pickering <pgpick@gmx.at>
Marco Eilers <eilers.marco@googlemail.com>
Thomas Bracht Laumann Jespersen <laumann.thomas@gmail.com>
