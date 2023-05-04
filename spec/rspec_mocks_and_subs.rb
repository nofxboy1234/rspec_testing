# Test Double
#   Test Stub
#     - Uses #allow
#     - Fake object
#     - Used in place of a real object
#     - Return pre-specified hard-coded values in response to method calls
#     - Help with inputs
#     - Trick your program into working properly under test

#   Mock Object
#     - Uses #expect
#     - Fake object
#     - Used in place of a real object
#     - Listens to the methods called on the mock object
#     - Ensure that the right methods get called on it
#     - Help with outputs
#     - Spy on your program in the cases where you’re not able to test something directly

# If the method under test returns a value & it has no side effects 
# (creating files, making API requests, etc.) then you don’t need a mock. 
# Just check for the return value.

# If the method is working with external objects & sending orders to them, 
# then you can mock the interactions with these objects.

# If the method is REQUESTING data from an external service (like an API), 
# then you can use a stub to provide this data for testing purposes.

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
    payment_gateway = double # RSpec::Mocks::Double (Stub)
    # A stub is only a method with a canned response, it doesn’t care about behavior.
    allow(payment_gateway).to receive(:charge).and_return(payment_id: 1234)

    logger = double # RSpec::Mocks::Double (Mock)
    # It needs (not just can, but has to, and it will raise an exception if not)
    # to receive a record_payment method call with the value 1234
    # A mock expects methods to be called, if they are not called the test will fail.

    # You use mocks to test the interaction between two objects. 
    # Instead of testing the output value, like in a regular expectation.
    # In a regular test you check the return value of a method.
    # When using a mock you are testing the behavior.
    expect(logger).to receive(:record_payment).with(1234)

    payment = Payment.new(payment_gateway, logger)
    payment.total_cents = 1800
    payment.save
  end
end
