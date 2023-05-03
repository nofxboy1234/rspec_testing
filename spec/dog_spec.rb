require './lib/dog'
# require_relative '../lib/dog'
require 'pry-byebug'

RSpec.describe Dog do
  describe '#bark' do
    it 'returns "Woof!"' do
      expect(subject.bark).to eql('Woof!')
    end
  end

  describe '#hungry?' do
    it 'returns true if hunger_level is more than 5' do
      dog = described_class.new(hunger_level: 7)
      expect(dog).to be_hungry
    end

    it 'returns false if hunger_level is 5 or less' do
      dog = described_class.new(hunger_level: 5)
      expect(dog).to_not be_hungry
    end
  end
end
