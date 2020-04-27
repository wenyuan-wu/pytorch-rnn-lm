# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/bricksdont/pytorch-rnn-lm
    cd pytorch-rnn-lm

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh

# Comments
## Dataset

## Training hyperparameters
vocab_size: 5000

| Embedding size | Test perplexity (↓) | Time (↑) |
| --- | --- | --- |
| 100 | 59.96 | 138 |
| 200 | 46.52 | 199 |
| 300 | 42.48 | 279 |
| 400 | 41.04 | 371 |
| 500 | 39.76 | 432 |

vocab_size: 10000

| Embedding size | Test perplexity (↓) | Time (↑) |
| --- | --- | --- |
| 100 | 75.91 | 177 |
| 200 | 61.42 | 237 |
| 300 | 0 | 0 |
| 400 | 0 | 0 |
| 500 | 0 | 0 |

longer time with bigger size, but not significant improvement
