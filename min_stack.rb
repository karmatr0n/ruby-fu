require 'test/unit'
require 'debug'

class MinStack
  attr_reader :stack, :min_stack

  def initialize
    @stack = []
    @min_stack = []
  end

  def push(value)
    stack.push(value)
    min_stack.push(value) if value <= min_stack.last.to_i
  end

  def pop
    min_stack.pop if min_stack.last == top
    stack.pop
  end

  def top
    stack.last
  end

  def get_min
    min_stack.last
  end
end


class TestMinStack < Test::Unit::TestCase
  def test_min_stack
    stack = MinStack.new
    stack.push(-2)
    stack.push(0)
    stack.push(-3)
    assert_equal(-3, stack.get_min)
    stack.pop
    assert_equal(0, stack.top)
    assert_equal(-2, stack.get_min)
  end
end
