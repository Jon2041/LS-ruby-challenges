class Series
  def initialize(string)
    @string = string
  end

  def slices(size)
    raise ArgumentError if size > @string.length
    results = []
    @string.split('').map(&:to_i).each_cons(size) { |subset| results << subset }
    results
  end
end
