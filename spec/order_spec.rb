RSpec.describe Order do
  subject do
    Order.new({ state: :created,
                payment_method: payment_method })
  end

  let(:payment_method) { double('credit card') }

  describe '#checkout' do
    it 'sets the state to completed' do
      subject.checkout

      expect(subject.state).to eql(:completed)
    end

    it 'calculates tax based on the order' do
      expect(TaxCalculator).to receive(:calculate).with(subject) { 10.0 }

      subject.checkout
    end

    it 'calls out to the payment gateway with the items totals and tax' do
      expect(PaymentGateway).to receive(:process_payment)
        .with(30.0, payment_method)
        .and_return(:success)

      subject.checkout
    end

    it 'emails the buyer'
  end
end
