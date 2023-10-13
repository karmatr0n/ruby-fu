require 'test/unit'

# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# @param {String} s
# @return {Boolean}
def match?(p1, p2)
   (p1 == '{' && p2 == '}') || (p1 == '[' && p2 == ']') || (p1 == '(' && p2 == ')')
end

def is_valid(s)
    my_stack = []
    s.each_char do |c|
        if "{[(".include?(c)
            my_stack.push(c)
        else
            top = my_stack.pop
            return false unless match?(top, c)
        end
    end
    return my_stack.empty?
    # Time Complexity: O(n)
    # Space Complexity: O(n)
end

class TestValidParentheses < Test::Unit::TestCase
    def test_valid_parentheses
        assert_equal(true, is_valid("()"))
        assert_equal(true, is_valid("()[]{}"))
        assert_equal(false, is_valid("(]"))
        assert_equal(false, is_valid("([)]"))
        assert_equal(true, is_valid("{[]}"))
    end
end
