require './lib/dog'
# require_relative '../lib/dog'
require 'pry-byebug'

describe Dog do
  describe '#bark' do
    it 'returns "Woof!"' do
      expect(subject.bark).to eql('Woof!')
    end
  end

  describe '#hungry?' do
    it 'returns true if hunger_level is more than 5' do
      hungry_dog = Dog.new(hunger_level: 7)
      expect(hungry_dog.hungry?).to eq(true)
    end

    it 'returns false if hunger_level is 5 or less' do
      hungry_dog = Dog.new(hunger_level: 5)
      expect(hungry_dog.hungry?).to eq(false)
    end
  end
end
