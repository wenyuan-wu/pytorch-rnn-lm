#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models-tolstoy_10000

num_threads=12
device="0"
emsize=300

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/tolstoy \
        --epochs 40 \
        --emsize $emsize --nhid $emsize --dropout 0.5 --tied \
        --save $models-tolstoy_10000/model.$emsize.pt \
        --cuda
)

echo "time taken:"
echo "$SECONDS seconds"
