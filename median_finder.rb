# Simple sorting
class MedianFinder
  def initialize()
      @numbers = []
  end

  def add_num(num)
      @numbers.unshift(num)
  end

  def find_median()
    @numbers.sort!
    n = @numbers.size
    if @numbers.size % 2 == 1
      @numbers[@numbers.size / 2].to_f
    else
      mid_index = @numbers.size / 2
      (@numbers[mid_index - 1] + @numbers[mid_index]) * 0.5
    end
  end
end
