Node = Struct.new(:word, :definition, :pointer)

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # Time complexity: O(1)
  def add_node(word, definition)
    new_node = Node.new(word, definition)
    @tail.pointer = new_node unless empty?
    @head = new_node if empty?
    @tail = new_node
  end

  # Time complexity: O(n)
  def insert_node(index, word, definition)
    prev_node = access_node_at(index-1)
    new_node = Node.new(word, definition, prev_node.pointer)
    prev_node.pointer = new_node
    puts "Node inserted at position #{index}"
    new_node
  end

  # Time complexity: O(n)
  def read(index)
    node = access_node_at(index, true)
    if node
      output = "#{node.word}: #{node.definition} after #{index} steps"
      puts output
      node
    else
      puts "Nothing to see here. Move along."
      nil
    end
  end

  def crawl(term)
    node = head
    until node.nil? || node.word == term
      yield(node) if block_given?
      node = node.pointer unless node.nil?
    end
    node
  end

  def empty?
    head.nil?
  end

  def reverse
    current_node = head
    @tail = head
    previous = nil
    begin
      next_node = current_node.pointer
      current_node.pointer = previous
      previous = current_node
      current_node = next_node if next_node
    end until !next_node
    @head = current_node
  end

  private
  def access_node_at(index, debug=false)
    current_node = head
    puts "Looping through linked list" if debug
    index.times do |i|
      if current_node
        puts "On step #{i}, found #{current_node.word}" if debug
        current_node = current_node.pointer
      end
    end
    current_node
  end

end
