word_chainer
============

Word Chainer Program
Creates a word chain from the start word to the end word.  Program starts by creating a word chain tree.  The tree finds
adjacent words to the current node and adds them as children to the node if they are not duplicate words.  After the end
word has been found, the program then iterates upward through the tree from the end word to the start word to find the
word chain.
