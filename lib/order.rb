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
    process_payment_status = PaymentGateway.process_payment(tax + items_total,
                                                            @payment_method)
    
    if process_payment_status == :success
      @state = :completed
    else
      @state = :payment_failed
    end
  end
end
