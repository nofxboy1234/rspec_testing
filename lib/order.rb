class Order
  attr_reader :state, :payment_method, :items

  def initialize(attrs)
    @state = attrs[:state] || :created
    @payment_method = attrs[:payment_method]
    @items = attrs[:items]
  end

  def checkout
    items_total = items.sum(&:total)
    tax = TaxCalculator.calculate(self)
    PaymentGateway.process_payment(tax + items_total, @payment_method)
    @state = :completed
  end
end
