require 'rspec'
require 'hash_table'

describe HashTable do
  let(:ht) { HashTable.new }

  describe '#new' do
    it 'creates an empty buckets array' do
      expect(ht.buckets.length).to eq(26)
    end
  end

  describe '#hash' do
    it 'returns index number of the first letter of a word' do
      expect(ht.hash('apple')).to eq(0)
      expect(ht.hash('butter')).to eq(1)
    end
  end

  describe '#insert' do
    it "adds a word onto the end of a bucket's list" do
      ht.insert('apple', 'fruit')
      expect(ht.buckets[0].read(0).definition).to eq('fruit')
    end
  end

  describe '#define' do
    it "returns a description when given a word" do
      ht.insert('kumquat', 'the weirdest fruit')
      expect(ht.define('kumquat')).to eq('the weirdest fruit')
    end
    it 'returns "Not Found" if the word doesn\'t exist' do
      expect(ht.define('passionfruit')).to eq("Not Found")
    end
  end

  describe '#render_list' do
    it "prints a readable dictionary" do
      ht.insert('kumquat', 'the weirdest fruit')
      ht.insert('apple', 'the weirdest fruit')
      ht.insert('banana', 'the weirdest fruit')
      expect{ht.render_list}.not_to raise_error
      expect{ht.render_list}.to output(/kumquat/).to_stdout
    end
  end

  describe '#load_file' do
    it "can load a file without crashing" do
      expect{ht.load_file("dictionary_words.txt")}.not_to raise_error
    end
    it "saves each word and it's definition" do
      ht.load_file("dictionary_words.txt")
      expect(ht.define('kumquat')).to eq("The definition of kumquat is kumquat")
    end
  end
end
