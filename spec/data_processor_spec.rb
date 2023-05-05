describe DataProcessor do
  let(:processor) { described_class.new }

  it 'adds processed to valid data' do
    validator = double(:validator, valid?: true)
    expect(processor.process('foo', validator)).to eq('foo processed')
  end
end