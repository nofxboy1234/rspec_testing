describe DataProcessor do
  let(:processor) { described_class.new }

  context 'with valid data' do
    it 'adds processed to valid data' do
      validator = double(:validator, valid?: true)
      expect(processor.process('foo', validator)).to eq('foo processed')
    end
  end

  context 'with invalid data' do
    it 'raises Error' do
      validator = double(:validator, valid?: false)
      expect { processor.process('foo', validator) }
        .to raise_error(DataProcessor::Error)
    end
  end
end
