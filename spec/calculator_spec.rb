require './lib/calculator'
# require_relative '../lib/calculator'

describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it 'returns the sum of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe '#multiply' do
    it 'returns the product of two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(7, 3)).to eql(21)
    end

    it 'returns the product of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(5, 20, 0.5)).to eql(50.0)
    end
  end
end
