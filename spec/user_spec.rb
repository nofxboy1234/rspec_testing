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
  subject { User.new('Francisca', "#{year}-01-01") }

  context 'when born in 2001' do
    let(:year) { 2001 }

    it { should_not be_born_in_leap_year }
  end

  context 'when born in 1900' do
    let(:year) { 1900 }

    it { should_not be_born_in_leap_year }
  end

  context 'when born in 2000' do
    let(:year) { 2000 }

    it { should be_born_in_leap_year }
  end


  context 'when born in 2004' do
    let(:year) { 2004 }

    it { should be_born_in_leap_year }
  end
end
