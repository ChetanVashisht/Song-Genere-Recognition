# Song Genere Recognition

Code written in Matlab 2012R.

The dataset is from GTZAN's music collection available at http://marsyasweb.appspot.com/download/data_sets.
The project classifies a song into 10 generes based on the input. Mean and covariance of the MFCCs are
chosen as the features extracted. The model used for classification is KNN(K Nearest Neighbours).

To run the program:
> Launch Matlab and run main


	i =
		1
	i = 
		2
	...
	...
	...
	i =
		300
	c1 = 
		30     0     0     0     0     0     0     0     0     0
	     1    29     0     0     0     0     0     0     0     0
	     0     0    30     0     0     0     0     0     0     0
	     0     0     0    22     8     0     0     0     0     0
	     0     0     0     0    30     0     0     0     0     0
	     0     0     0     0     0    30     0     0     0     0
	     0     0     0     2     0     0    21     7     0     0
	     0     0     0     0     0     0     0    30     0     0
	     0     0     0     0     0     0     0     2    28     0
	     0     0     0     0     0     0     0     0     1    29

