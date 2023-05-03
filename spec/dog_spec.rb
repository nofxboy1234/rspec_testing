require './lib/dog'
# require_relative '../lib/dog'

describe Dog do
  describe '#bark' do
    it 'returns "Woof!"' do
      dog = Dog.new
      expect(dog.bark).to eql('Woof!')
    end
  end
end