require 'test/unit'

# Given a string s, find the length of the longest substring without repeating characters.
#
# All previous implementations have no assumption on the charset of the string s.
# If we know that the charset is rather small, we can mimic what a HashSet/HashMap does with a boolean/integer array
# as direct access table. Though the time complexity of query or insertion is still O(1)O(1)O(1), the constant factor
# is smaller in an array than in a HashMap/HashSet. Thus, we can achieve a shorter runtime by the replacement here.

# Commonly used tables are:

# int[26] for Letters 'a' - 'z' or 'A' - 'Z'
# int[128] for ASCII
# int[256] for Extended ASCII
#
def length_of_longest_substring(s)
    charset = {}
    left = right = res = 0
    while right < s.length do
        codepoint = s[right].ord
        if charset.key?(codepoint) && left <= charset[codepoint] && charset[codepoint] < right
            left = charset[codepoint] + 1
        end
        res = [res, right - left + 1].max
        charset[codepoint] = right
        right += 1
    end

    return res
end
# Time complexity: O(n)
# Space complexity: O(m)
#
class TestLengthOfLongestSubstring < Test::Unit::TestCase
    def test_length_of_longest_substring
        assert_equal(3, length_of_longest_substring('abcabcbb'))
        assert_equal(1, length_of_longest_substring('bbbbb'))
        assert_equal(3, length_of_longest_substring('pwwkew'))
        assert_equal(0, length_of_longest_substring(''))
        assert_equal(1, length_of_longest_substring(' '))
        assert_equal(8, length_of_longest_substring(' abcdefgc     '))
        assert_equal(1, length_of_longest_substring('a'))
        assert_equal(1, length_of_longest_substring('aa'))
        assert_equal(1, length_of_longest_substring('aaaa'))
    end
end
