require 'test/unit'

def count_distinct_chars(str)
  chars = {}
  str.each_char do |char|
    chars[char] = true
  end
  chars.size
end

class TestCountDistinctChars < Test::Unit::TestCase
  def test_count_distinct_chars
    assert_equal(3, count_distinct_chars('abca'))
    assert_equal(1, count_distinct_chars('aaaa'))
    assert_equal(0, count_distinct_chars(''))
    assert_equal(13, count_distinct_chars('hi there, i am pankaj'))
  end
end
