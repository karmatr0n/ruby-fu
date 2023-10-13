require 'test/unit'
# Given a string s, return the first non-repeating character in it and return its index. If it does not exist, return -1.
#
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    count_chars = s.chars.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
    s.chars.each_with_index do |char, index|
        return index if count_chars[char] == 1
    end
    return -1
   # Time complexity: O(n)
   # Space complexity: O(1)
end

class TestFirstUniqChar < Test::Unit::TestCase
    def test_first_uniq_char
        assert_equal(0, first_uniq_char('leetcode'))
        assert_equal(2, first_uniq_char('loveleetcode'))
        assert_equal(-1, first_uniq_char('aabb'))
    end
end
