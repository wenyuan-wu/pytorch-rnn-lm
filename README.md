# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, run the following command line:

    `pip install virtualenv`

# Steps

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install the required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

**Changes was made to download the new data set**

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh

# Feedback
## Data set
For this task, the novel War and Peace from Leo Tolstoy is chosen as the data set. The attempt to "be creative" has certainly failed: there are not enough corpora written in fictional language like Klingon, 
Dothraki or any other elvish languages from Middle-earth. 
## Training hyperparameters
In thepreprocess phase, two data sets are prepared with the vocabulary size of 5000 and 10000 respectively. To discuss the 
impact of different embedding sizes, each data set will be trained 5 times with embedding size set form 100 to 500. The
results are the following:

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
| 300 | 54.52 | 330 |
| 400 | 52.35 | 427 |
| 500 | 50.70 | 677 |

According to the tables above, the conclusion can be drawn that with higher embedding size, the trained models gain lower 
perplexity, even though more time will be spent. On the other hand, there's a significant improvement when the size increases
from 100 to 200, while much less enrichment is reflected in scores of perplexity from 200 up to 500. In a word, balance 
needs to be fitted between model performance and time consumption. Another interesting finding from the tables is that
vocabulary size of 10000 throws respectively worse results, which means that in this case larger vocabulary is not beneficial for training.

## Comments
On my PC the environment variable **CUDA_VISIBLE_DEVICES** takes no effect to specify a cuba enabled GPU, therefore the 
**--cuda** option has to be manually enabled. On the other hand, **OMP_NUM_THREADS** works as intended, which is weird.
OS: Ubuntu 18.04.4 LTS
Python 3.7.5
