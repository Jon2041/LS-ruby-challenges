class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def is_valid?(trinary)
    return true if trinary.chars.all? { |char| ('0'..'2').to_a.include?(char) }
    false
  end

  def to_decimal
    return 0 unless is_valid?(@trinary)
    digits = @trinary.chars.reverse.map(&:to_i)
    digits.map.with_index { |digit, idx| digit * (3 ** idx) }.inject(:+)
  end
end
