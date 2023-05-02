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
    # false
    leap_year?(Date.parse(@birthday).year)
  end
end

describe User do
  context 'when born in 2001' do
    it 'is not born in a leap year' do
      user = User.new('Francisca', '2001-01-01')
      expect(user).not_to be_born_in_leap_year
    end
  end

  context 'when born in 1900' do
    it 'is not born in a leap year' do
      user = User.new('Francisca', '1900-01-01')
      expect(user).not_to be_born_in_leap_year
    end
  end

  context 'when born in 2000' do
    it 'is born in a leap year' do
      user = User.new('Francisca', '2000-01-01')
      expect(user).to be_born_in_leap_year
    end
  end

  context 'when born in 2004' do
    it 'is born in a leap year' do
      user = User.new('Francisca', '2004-01-01')
      expect(user).to be_born_in_leap_year
    end
  end

end