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
    it 'returns "not found" if the word doesn\'t exist' do
      expect(ht.define('passionfruit')).to eq("Not found")
    end
  end
end
