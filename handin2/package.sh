#!/bin/bash

SRC="src/*.m src/*.mat src/*.dt"
GRAPHICS="src/*.eps"
REPORT="handin2.pdf README.txt"

ARCHIVE="handin2philipmarcothomas"

rm -rf $ARCHIVE
mkdir $ARCHIVE
mkdir -p $ARCHIVE/src


cp $SRC $GRAPHICS $ARCHIVE/src
cp $REPORT $ARCHIVE
zip -r $ARCHIVE.zip $ARCHIVE
