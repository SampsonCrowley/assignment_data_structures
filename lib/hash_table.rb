require_relative 'linked_list'

class HashTable
  attr_reader :buckets

  def initialize
    @buckets = Array.new(26) { LinkedList.new }
  end

  def hash(word)
    word[0].downcase.ord - 97
  end

  def insert(word, definition)
    buckets[hash(word)].add_node(word, definition)
  end

  def render_list
    steps = 0
    buckets.each do |bucket|
      steps += 1
      bucket.crawl(nil) do |node|
        steps += 1
        puts "#{node.word}:\n#{node.definition}\nfound in #{steps} steps\n\n"
      end
    end
  end

  def define(term)
    # locates word, returns definition
    node = buckets[hash(term)].crawl(term)
    node ? node.definition : "Not Found"
  end


  def load_file(file_path)
    words = File.readlines(file_path).map {|w| w.strip }
    words.each {|word| insert(word, "The definition of #{word} is #{word}")}
  end
end
