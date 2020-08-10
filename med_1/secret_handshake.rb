class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump', true]

  def initialize(number)
    @number = convert_to_binary number
  end

  def convert_to_binary number
    return number.to_s if is_string? number
    result = ''

    while number > 0 do
      number, remainder = number.divmod(2)
      result += remainder.to_s
    end

    p result
  end

  def is_string? number
    number == number.to_s
  end

  def commands
    result = []
    return result if @number.to_i.zero?

    command_array = @number.chars.zip(COMMANDS)
    rev = command_array[4]

    0.upto(max) do |ind|
      result << command_array[ind].last if command_array[ind].first == '1'
    end

    result.reverse! if rev

    result
  end

  def max
    @number.length >= 4 ? 3 : @number.length - 1
  end
end
