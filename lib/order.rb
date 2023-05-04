class Order
  attr_reader :state

  def initialize(attrs)
    @state = attrs[:state] || :created
  end

  def checkout
    TaxCalculator.calculate(self)
    @state = :completed
  end
end
