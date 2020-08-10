class PerfectNumber
  def initialize; end

  def self.valid_number(number)
    raise StandardError.new "Numbers must be greater than zero." if number <= 0
  end

  def self.determine_divisors(number)
    divisors = []
    counter = 1
    while counter < number do
      divisors << counter if number % counter == 0
      counter += 1
    end
    divisors
  end

  def self.aliquot_number(number)
    determine_divisors(number).inject(:+)
  end

  def self.classify(number)
    valid_number(number)
    case aliquot_number(number)
    when number       then 'perfect'
    when (0...number) then 'deficient'
    else                   'abundant'
    end
  end
end
