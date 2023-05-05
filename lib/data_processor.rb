class DataProcessor
  Error = Class.new(StandardError)

  def process(data, validator)
    raise Error unless validator.valid?(data)

    # simple logic to show the idea
    "#{data} processed"
  end
end
