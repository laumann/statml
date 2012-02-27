#
#  Reads the body fat data set from the bodyfat.mat file.
#

load( 'bodyfat.RData' )

ridx <- sample( 1:dim( data )[1], dim( data )[1] )

test <- data[ridx[201:length( ridx )],]
train <- data[ridx[1:200],]
