# Test Double
#   Test Stub
#     - allow?
#     - Fake object
#     - Used in place of a real object
#     - Return pre-specified hard-coded values in response to method calls
#     - Help with inputs
#     - Trick your program into working properly under test

#   Mock Object
#     - expect?
#     - Fake object
#     - Used in place of a real object
#     - Listens to the methods called on the mock object
#     - Ensure that the right methods get called on it
#     - Help with outputs
#     - Spy on your program in the cases where you’re not able to test something directly

class Payment
  attr_accessor :total_cents

  def initialize(payment_gateway, logger)
    @payment_gateway = payment_gateway
    @logger = logger
  end

  def save
    response = @payment_gateway.charge(total_cents)
    @logger.record_payment(response[:payment_id])
  end
end

class PaymentGateway
  def charge(_total_cents)
    puts "THIS HITS THE PRODUCTION API AND ALTERS PRODUCTION DATA. THAT'S BAD!"

    { payment_id: rand(1000) }
  end
end

class Logger
  def record_payment(payment_id)
    puts "Payment id: #{payment_id}"
  end
end

describe Payment do
  it 'records the payment' do
    # payment_gateway = PaymentGateway.new
    payment_gateway = double # RSpec::Mocks::Double
    allow(payment_gateway).to receive(:charge).and_return(payment_id: 1234)

    # logger = Logger.new
    logger = double
    expect(logger).to receive(:record_payment).with(1234)

    payment = Payment.new(payment_gateway, logger)
    payment.total_cents = 1800
    payment.save
  end
end
