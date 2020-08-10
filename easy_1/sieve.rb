class Sieve
  def initialize(limit)
    @limit = limit
    @candidates = (2..limit).to_a
  end

  def primes
    2.upto(@limit / 2) do |divisor|
      @candidates.select! do |candidate|
        candidate == divisor ||
        candidate % divisor != 0
      end
    end
    @candidates
  end
end
