# sample code for reading data in Shark format 
# with corresponding labels
#
# example:
#            
# data, labels = readSharkData('../Data/C.asc')
#
# have fun, Christian

import csv
import numpy as np

def readSharkData(filename):
    '''Reads data stored in Shark ASCII format.

    Arguments: data file, for example '../Data/C.asc'
    Returns:   description of proteins, list of corresponding labels'''

    fi         = open(filename)

    # read header
    dr         = csv.reader(fi, delimiter=' ', quoting =csv.QUOTE_NONE)
    header     = dr.next()
    if(len(header) != 5):
        raise NameError(filename + ' does not have a valid header')
    if(header[0] != '#'):
        raise NameError(filename + ' does not have a valid header')
    if(header[4] != 'ascii'):
        raise NameError(filename + ' is not in ascii format')
    N          = int(header[1])
    attributes = int(header[2])
    outputs    = int(header[3])

    # read attributes
    fi.seek(0)
    X = np.loadtxt(fi, dtype='d', delimiter=' ', comments='#', usecols=range(0, attributes))
    # readl labels
    fi.seek(0) # here is room for speed improvements
    y = np.loadtxt(fi, dtype='d', delimiter=' ', comments='#', usecols=range(attributes, attributes+outputs))

    fi.close()
    if(len(y) != N):
        raise NameError('number of patterns in ' + filename + ' does not match header')
    return X, y

