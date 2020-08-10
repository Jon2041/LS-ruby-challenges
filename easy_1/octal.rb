class Octal
  def initialize(octal)
    @octal = octal
  end

  def is_valid?(octal)
    return true if octal.chars.all? { |char| ('0'..'7').to_a.include?(char) }
    false
  end

  def to_decimal
    return 0 unless is_valid?(@octal)
    digits = @octal.chars.reverse.map(&:to_i)
    digits.map.with_index { |digit, idx| digit * (8 ** idx) }.inject(:+)
  end
end
