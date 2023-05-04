class Order
  attr_reader :state, :payment_method

  def initialize(attrs)
    @state = attrs[:state] || :created
    @payment_method = attrs[:payment_method]
  end

  def checkout
    TaxCalculator.calculate(self)
    PaymentGateway.process_payment(30.0, @payment_method)
    @state = :completed
  end
end
