require 'test/unit'

# Given two strings needle and haystack, return the index of the first occurrence of needle in haystack,
# or -1 if needle is not part of haystack
def str_str(str, sub)
    return 0 if str == sub
    return -1 if sub.length > str.length
    0.upto(str.length - 1) do |i|
        return i if  str[i, sub.length] == sub
    end
    return -1
    # Time complexity: O(n)
    # Space complexity: O(1)
end

class TestStrStr < Test::Unit::TestCase
    def test_str_str
        assert_equal(2, str_str('hello', 'll'))
        assert_equal(0, str_str('sadbutsad', 'sad'))
        assert_equal(4, str_str('mississipi', 'issipi'))
        assert_equal(-1, str_str('leetcode', 'leeto'))
        assert_equal(-1, str_str('leetcode', 'to'))
        assert_equal(-1, str_str('leetcode', 'codeleet'))
    end
end
