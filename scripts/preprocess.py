#! /bin/env/python

import sys
import time
import argparse
import logging

from collections import Counter


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument("--vocab-size", type=int, help="Size of vocabulary", required=True)
    parser.add_argument("--tokenize", action="store_true", help="Assume input strings are not tokenized yet.", required=False)
    parser.add_argument("--unk-string", type=str, help="String to use for out-of-vocabulary tokens.", default="<unk>", required=False)

    args = parser.parse_args()

    return args

def main():

    tic = time.time()

    args = parse_args()

    logging.basicConfig(level=logging.DEBUG)
    logging.debug(args)

    lines = sys.stdin.readlines()

    tokens = []

    for line in lines:
        tokens.append(line.split())

    counter = Counter(tokens)

    # try to free up memory early

    del tokens

    vocabulary = [token for token, frequency in counter.most_common(args.vocab_size)]

    for line in lines:
        output_tokens = []
        tokens = line.split()

        for token in tokens:
            if token in vocabulary:
                output_tokens.append(token)
            else:
                output_tokens.append(args.unk_string)

        output_string = " ".join(output_tokens)
        sys.stdout.write(output_string + "\n")

    toc = time.time() - tic

    logging.debug("Time taken: %f seconds" % toc)

if __name__ == '__main__':
    main()
