describe DataProcessor do
  let(:processor) { described_class.new }

  context 'with valid data' do
    it 'adds processed to data' do
      # validator = double(:validator, valid?: true)

      # validator = double(:validator)
      # allow(validator).to receive(:valid?).and_return(true)

      # it works because true is default value for Validator
      expect(processor.process('foo')).to eq('foo processed')
    end
  end

  context 'with invalid data' do
    it 'raises Error' do
      # validator = double(:validator, valid?: false)

      # validator = double(:validator)
      # allow(validator).to receive(:valid?).and_return(false)

      allow_any_instance_of(Validator).to receive(:valid?).and_return(false)

      expect { processor.process('foo') }
        .to raise_error(DataProcessor::Error)
    end
  end

  it 'calls validator.valid?' do
    # validator = double(:validator)
    # expect(validator).to receive(:valid?).with('foo').and_return(true)

    expect_any_instance_of(Validator).to receive(:valid?)
      .with('foo').and_return(true)

    processor.process('foo')
  end
end
