RSpec.describe Order do
  subject { Order.new({ state: :created }) }

  describe '#checkout' do
    it 'sets the state to completed' do
      subject.checkout

      expect(subject.state).to eql(:completed)
    end
  end
end
