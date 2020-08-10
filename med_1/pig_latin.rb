class PigLatin
  VOWELS = %w(a e i o u)
  TRICKY = %w(q y x)

  attr_reader :leading_consonant, :word_bulk
  
  def initialize(word)
    @word = word
    @leading_consonant = leading_consonant
    @word_bulk = word[leading_consonant.size, word.size]
  end

  def leading_consonant
    leading = ''

    for i in 0..@word.length do
      break if VOWELS.include? @word[i]
      if TRICKY.include?(@word[i])
        leading += tricky(@word[i])
        break
      else
        leading += @word[i]
      end
    end

    leading
  end

  def tricky(char)
    case char
    when 'q'       then return 'qu'
    when 'y'       then return test_y
    when 'x'       then return test_x
    end
  end

  def test_y
    VOWELS.include?(@word[1]) ? 'y' : ''
  end

  def test_x
    VOWELS.include?(@word[1]) ? 'x' : ''
  end

  def self.translate(words)
    result = []
    words.split.each do |word|
      word = PigLatin.new(word)
      result << "#{word.word_bulk}#{word.leading_consonant}#{'ay'}"
    end
    result.join(' ')
  end
end
