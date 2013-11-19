word_chainer
============

word chain- a list of words in which each successive word has changed only a single letter from the previous word.

 * WordChainer creates a tree of many word chains from the root (initial word) until the target word is found, then finds the shortest path from the root to the target word using a breadth-first search.  Words that can be used are definied by those that can be found within dictionary.txt.
 * TreeNode is an implementation of a tree data structure that can have zero to many children that can be searched using predefined methods for depth-first and bread-first algorithm.
