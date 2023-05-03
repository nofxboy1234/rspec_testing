require './lib/dog'
# require_relative '../lib/dog'

describe Dog do
  subject { Dog.new }

  describe '#bark' do
    it 'returns "Woof!"' do
      expect(subject.bark).to eql('Woof!')
    end
  end
end
