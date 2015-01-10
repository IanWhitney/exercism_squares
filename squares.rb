class Squares
  attr_accessor :numbers

  def initialize(number)
    self.numbers = Nums.new(number)
  end

  def square_of_sums
    numbers.inject(0) do |ret, n|
      ret += n
    end ** 2
  end

  def sum_of_squares
    numbers.inject(0) do |ret, n|
      ret += n**2
    end
  end

  def difference
    square_of_sums - sum_of_squares
  end
end

class Nums
  include Enumerable

  def initialize(number)
    @members = (1..number).to_a
  end

  def each &block
    @members.each{|member| block.call(member)}
  end
end
