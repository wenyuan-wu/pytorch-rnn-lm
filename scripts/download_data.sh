#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

# Download War and Peace from Leo Tolstoy as dataset

mkdir -p $data/tolstoy

mkdir -p $data/tolstoy/raw

wget -O tolstoy.txt https://www.gutenberg.org/files/2600/2600-0.txt
mv tolstoy.txt $data/tolstoy/raw

# preprocess slightly

cat $data/tolstoy/raw/tolstoy.txt | python $base/scripts/preprocess_raw.py > $data/tolstoy/raw/tolstoy.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/tolstoy/raw/tolstoy.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 10000 --tokenize --lang "en" > \
    $data/tolstoy/raw/tolstoy.preprocessed.txt

# split into train, valid and test

head -n 4000 $data/tolstoy/raw/tolstoy.preprocessed.txt > $data/tolstoy/valid.txt
head -n 8000 $data/tolstoy/raw/tolstoy.preprocessed.txt | tail -n 4000 > $data/tolstoy/test.txt
tail -n 44163 $data/tolstoy/raw/tolstoy.preprocessed.txt > $data/tolstoy/train.txt