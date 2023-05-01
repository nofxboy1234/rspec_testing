require 'date'

def leap_year?(year)
  year % 400 == 0 or year % 100 != 0 and year % 4 == 0
end

class User
  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  def name
    @name
  end

  def born_in_leap_year?
    leap_year?(Date.parse(@birthday).year)
  end
end

describe User do
  context 'when born in 2000' do
    it 'is born in a leap year' do
      user = User.new('Francisca', '2000-01-01')
      expect(user.born_in_leap_year?).to eq true
    end

    # example 'is at voting age' do
      
    # end
  end
end