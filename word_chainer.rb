require './tree_node.rb'

class WordChainer
  
  attr_accessor :root
  def initialize
    @dictionary = load_dictionary
    
    start_word = prompt_for_first_word
    end_word = prompt_for_end_word
    
    @root = TreeNode.new(start_word)
    find_chain(start_word, end_word)
  end
  
  def prompt_for_first_word
    start_word = ""
    
    begin
      puts "What is the first word in the word chain?"
      start_word = gets.chomp
      
    end while start_word.length == 0 || !@dictionary.include?(start_word)
    
    start_word
  end
  
  def prompt_for_end_word
    end_word = ""
    
    begin
      puts "What is the ending word in the word chain?"
      end_word = gets.chomp
      
    end while end_word.length == 0 || !@dictionary.include?(end_word)
    
    end_word
  end
  
  def adjacent_words(word)
    adjacent_words = []
    possible_words = @dictionary.select { |el| el.length == word.length }
    
    word.each_char do |char|
      search_word = word.sub(char, ".")
      possible_words.each do |el|
        adjacent_words << el if el.match(/#{search_word}/)
      end
    end
    
    adjacent_words.uniq
  end
  
  def find_chain(start_word, end_word)
    current_words = [@root]
    words_visited = [@root.value]
    
    until word_found?(end_word)
      current_node = current_words.shift
      
      if current_node == nil
        puts "There is no chain from #{start_word} to #{end_word}."
        exit
      end
      
      adjacent_words = adjacent_words(current_node.value)
      
      adjacent_words.each do |curr_word|
        unless words_visited.include?(curr_word)
          new_node = TreeNode.new(curr_word, current_node)
          current_words.push(new_node)
        end
      end
      
      words_visited.concat(adjacent_words)
    end
    print_word_chain(build_chain(end_word))
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
  
  def print_word_chain(array)
    puts array.join(" > ")
  end
  
  def load_dictionary
    File.readlines("dictionary.txt").map { |word| word.chomp }
  end
end

WordChainer.new