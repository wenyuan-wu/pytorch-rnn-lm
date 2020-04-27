#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples-tolstoy

num_threads=12
device="0"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/tolstoy \
        --words 500 \
        --checkpoint $models-tolstoy/model.500.pt \
        --outf $samples-tolstoy/sample \
        --cuda
)
