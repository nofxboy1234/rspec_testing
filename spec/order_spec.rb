RSpec.describe Order do
  subject { Order.new({ state: :created }) }

  describe '#checkout' do
    it 'sets the state to completed' do
      subject.checkout

      expect(subject.state).to eql(:completed)
    end

    it 'calculates tax based on the order' do
      expect(TaxCalculator).to receive(:calculate).with(subject) { 10.0 }

      subject.checkout
    end

    it 'calls out to the payment gateway with the items totals and tax'

    it 'emails the buyer'
  end
end
