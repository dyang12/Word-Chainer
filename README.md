word_chainer
============

word chain- a list of words in which each successive word has changed only a single letter from the previous word.

Word Chainer Program

Word Chainer starts by prompting a user for a starting word and an ending word.  From the starting word, the program creates a tree branching out through each adjacent child until the ending word is found.  All words that have been visited are held within an array so that no infinite loops are created within the tree.  If a path is found, the program prints out the shortest path that is found to the word by using a breadth-first search.
