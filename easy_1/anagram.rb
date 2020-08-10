class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    result = candidates
    letters = @word.downcase.chars.sort
    result.select! { |candidate| candidate.downcase != @word.downcase }
    result.select! do |candidate|
      candidate.downcase.chars.sort == letters
    end
    result
  end
end
