class DataProcessor
  Error = Class.new(StandardError)

  def process(data)
    raise Error unless Validator.new.valid?(data)

    # simple logic to show the idea
    "#{data} processed"
  end
end

class Validator
  def valid?(data)
    true
  end
end
