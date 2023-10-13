require 'test/unit'
require 'debug'

class FreqStack
  attr_reader :freq, :grouped_freq, :max_freq

  def initialize
    @freq = Hash.new(0)
    @grouped_freq = {}
    @max_freq = 0
  end

  def push(x)
    f = freq.fetch(x, 0) + 1
    freq[x] = f
    @max_freq = f if f > @max_freq

    grouped_freq[f] ||= []
    grouped_freq[f].push(x)
  end

  def pop
    x = grouped_freq[@max_freq].pop
    freq[x] -= 1
    @max_freq -= 1 if grouped_freq[@max_freq].size.zero?
    x
  end
end

class TestFreqStack < Test::Unit::TestCase
  def test_freq_stack
    freqstack = FreqStack.new
    freqstack.push(5)
    freqstack.push(7)
    freqstack.push(5)
    freqstack.push(7)
    freqstack.push(4)
    freqstack.push(5)
    assert_equal(5,freqstack.pop)
    assert_equal(7,freqstack.pop)
    assert_equal(5,freqstack.pop)
    assert_equal(4,freqstack.pop)
  end
end
