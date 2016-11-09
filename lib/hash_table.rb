require_relative 'linked_list'

class HashTable
  attr_reader :buckets

  def initialize
    @buckets = Array.new(26) { LinkedList.new }
  end

  def hash(word)
    word[0].ord - 97
  end

  def insert(word, definition)
    bucket = hash(word)
    buckets[bucket].add_node(word, definition)
  end

  def render_list

  end

  def define(term)
    # locates word, returns definition
    buckets[hash(term)].crawl(term).definition
  end
end
