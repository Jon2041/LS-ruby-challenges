class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    array = @number.to_s.chars.reverse
    array.map!.with_index do |value, ind|
      num = value.to_i
      ind.odd? ? num *= 2 : num
      num > 9 ? num - 9 : num
    end
    array.reverse
  end

  def checksum
    self.addends.inject(:+)
  end

  def check_mod10
    self.checksum % 10
  end

  def valid?
    self.check_mod10.zero?
  end

  def self.create(number)
    incomplete = Luhn.new(number * 10)
    for i in 0..9 do
      complete = Luhn.new(incomplete.number + i)
      return complete.number if complete.valid?
    end
  end
end
