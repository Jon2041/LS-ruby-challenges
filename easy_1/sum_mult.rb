class SumOfMultiples

  def initialize(*base_nums)
    @base_nums = base_nums.to_a
  end

  def self.to(limit, multiples=[3,5])
    total = 0
    for i in 1...limit do
      total += i if multiples.any? { |multiple| i % multiple == 0 }
    end
    total
  end

  def to(limit)
    self.class.to(limit, @base_nums)
  end
end
