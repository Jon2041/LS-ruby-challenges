class Phrase
  def initialize(string)
    @words = cleanup(string)
    @count = {}
  end

  def cleanup(string)
    array = string.downcase.gsub(/[^a-z0-9']/, " ").split
    array.map! do |word|
      word[0] == word[-1] && word[0] == "'" ? word[1..word.length - 2] : word
    end
    array
  end

  def word_count
    @count = {}
    @words.each do |word|
      @count.keys.include?(word) ? @count[word] += 1 : @count[word] = 1
    end
    @count
  end
end
