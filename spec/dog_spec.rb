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
    context 'when hunger_level is more than 5' do
      it 'returns true' do
        dog = described_class.new(hunger_level: 7)
        expect(dog).to be_hungry
      end
    end

    context 'when hunger_level is 5 or less' do
      it 'returns false ' do
        dog = described_class.new(hunger_level: 5)
        expect(dog).to_not be_hungry
      end
    end
  end
end
