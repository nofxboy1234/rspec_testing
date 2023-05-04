RSpec.describe Order do
  subject do
    Order.new({ state: :created,
                payment_method: payment_method,
                items: items })
  end

  let(:payment_method) { double('credit card') }
  let(:items) do
    [double('item 1', total: 15.0),
     double('item 2', total: 5.0)]
  end

  describe '#checkout' do
    before do
      expect(TaxCalculator).to receive(:calculate).with(subject) { 10.0 }
                                                  .ordered
    end

    it 'calls out to the payment gateway with the items totals and tax',
       calls_out: true do
      expect(PaymentGateway).to receive(:process_payment)
        .with(30.0, payment_method)
        .and_return(:success)
        .ordered

      subject.checkout
    end

    context 'when the payment processes successfully' do
      before do
        expect(PaymentGateway).to receive(:process_payment)
          .and_return(:success)
      end
      
      it 'sets the state to completed', sets_state_when_success: true do
        subject.checkout

        expect(subject.state).to eql(:completed)
      end

      it 'emails the buyer'
    end

    context 'when the payment processes unsuccessfully' do
      before do
        expect(PaymentGateway).to receive(:process_payment)
          .and_return(:failure)
      end

      it 'sets the state to payment_failed', sets_state_when_fail: true do
        subject.checkout

        expect(subject.state).to eql(:payment_failed)
      end
    end
  end
end
