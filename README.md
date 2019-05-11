# Instructions
1. Download parameters:

```
wget https://github.com/decompositional-semantics-initiative/ParaBank-rewriter/releases/download/v0.1/params.best
```

2. Run on the example files in this repo:

```
./score.sh test_source.txt test_target.txt > scores.txt
```

It will print out a lot of logging messages to stderr.
If you redirect stdout to a file, it will be tab-separated with 1 line per line in the inputs, and columns denoting

```
negative loglikelihood<TAB>tokenized source<TAB>tokenized target
```


# Original README.md below

This is the rewriter model described in ParaBank (Hu et al. 2019).

Required packages are listed in `requirement.txt`. Please download `params.best` from the project website and place it under this directory.

Usage: `echo -e "This is a test.\tis|test\twas|exam" | ./paraphrase.sh`, where "is" and "test" are negative constraints, and "was" and "exam" are positive constraints.

Please cite the following paper if you would like to use this rewriter in your work:

> Hu, J. E., R. Rudinger, M. Post, & B. Van Durme. 2019. [ParaBank: Monolingual Bitext Generation and Sentential Paraphrasing via Lexically-constrained Neural Machine Translation](http://aaai.org/Papers/AAAI/2019/AAAI-HuJ.4052.pdf). Proceedings of AAAI 2019, Honolulu, Hawaii, January 26 – Feb 1, 2019.

To interact with the monolingual rewriter online, [please check out this live demo](http://cs.jhu.edu/~vandurme/pbr-1a-demo).
