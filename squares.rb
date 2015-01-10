class Squares
  attr_accessor :numbers

  def initialize(number)
    self.numbers = Nums.new(number)
  end

  def square_of_sums
    (calculate(0) { |ret, n| ret += n }) ** 2
  end

  def sum_of_squares
    calculate(0) { |ret, n| ret += n ** 2 }
  end

  def difference
    square_of_sums - sum_of_squares
  end

  private

  def calculate(start, &blk)
    numbers.inject(start) do |ret, n|
      blk.call(ret, n)
    end
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
