class Scrabble
  LETTER_SCORES = { %w(A E I O U L N R S T) => 1, %w(D G) => 2, %w(B C M P) => 3,
                    %w(F H V W Y) => 4, %w(K) => 5, %w(J X) => 8, %w(Q Z) => 10 }

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end
  
  def score
    return 0 if @word == nil
    letters = @word.upcase.chars
    score = 0

    letters.each do |letter|
      LETTER_SCORES.keys.each do |score_bin|
        score += LETTER_SCORES[score_bin] if score_bin.include?(letter)
      end
    end

    score
  end
end
