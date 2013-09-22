require './tree_node.rb'

class WordChainer
  
  attr_accessor :root
  def initialize(start_word, end_word)
    dictionary = load_dictionary
    @root = TreeNode.new(start_word)
    find_chain(start_word, end_word, dictionary)
  end
  
  def adjacent_words(word, dictionary)
    adjacent_words = []
    possible_words = load_dictionary.select { |el| el.length == word.length }
    
    word.each_char do |char|
      search_word = word.sub(char, ".")
      possible_words.each do |el|
        adjacent_words << el if el.match(/#{search_word}/)
      end
    end
    
    adjacent_words.uniq
  end
  
  def find_chain(start_word, end_word, dictionary)
    current_words = [@root]
    words_visited = [@root.value]
    
    until word_found?(end_word)
      current_node = current_words.shift
      
      if current_node == nil
        puts "There is no chain from #{start_word} to #{end_word}."
        exit
      end
      
      adjacent_words = adjacent_words(current_node.value, dictionary)
      
      adjacent_words.each do |curr_word|
        unless words_visited.include?(curr_word)
          new_node = TreeNode.new(curr_word, current_node)
          current_words.push(new_node)
        end
      end
      
      words_visited.concat(adjacent_words)
      puts words_visited.length
    end
  end
  
  def build_chain(end_word)
    path = []
    curr_node = @root.bfs(end_word)
    
    until curr_node.parent == nil
      path.unshift(curr_node.value)
      curr_node = curr_node.parent
    end
    
    path.unshift(curr_node.value)
  end
  
  def word_found?(end_word)
    @root.bfs(end_word)
  end
  
  def load_dictionary
    File.readlines("dictionary.txt").map { |word| word.chomp }
  end
end

chainer = WordChainer.new("brain", "charm")
p chainer.build_chain("charm")