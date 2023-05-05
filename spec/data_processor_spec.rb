describe DataProcessor do
  let(:processor) { described_class.new }

  describe '#process' do
    it 'calls validator.valid?' do
      validator = double(:validator)
      expect(validator).to receive(:valid?).with('foo').and_return(true)

      processor.process('foo', validator)
    end

    context 'with valid data' do
      it 'adds processed to valid data' do
        # validator = double(:validator, valid?: true)
        validator = double(:validator)
        allow(validator).to receive(:valid?).and_return(true)

        expect(processor.process('foo', validator)).to eq('foo processed')
      end
    end

    context 'with invalid data' do
      it 'raises Error' do
        # validator = double(:validator, valid?: false)
        validator = double(:validator)
        allow(validator).to receive(:valid?).and_return(false)

        expect { processor.process('foo', validator) }
          .to raise_error(DataProcessor::Error)
      end
    end
  end
end
