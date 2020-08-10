class DNA
  attr_reader :length

  def initialize(sequence)
    @sequence = sequence
    @length = sequence.length
  end

  def length_of_analysis(given_seq, comparison_seq)
    result = given_seq.length
    result = comparison_seq.length if comparison_seq.length < result
    result - 1
  end

  def [](i)
    @sequence[i]
  end

  def hamming_distance(comparison_seq)
    comparison = DNA.new(comparison_seq)
    counter = 0
    0.upto(length_of_analysis(self, comparison)) do |ind|
      counter += 1 if self[ind] != comparison[ind]
    end
    counter
  end
end
