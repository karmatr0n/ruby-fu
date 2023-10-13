require 'test/unit'

def generate_parenthesis(n)
    return [''] if n.zero?

    answer = []
    (0...n).reverse_each do |left_count|
        generate_parenthesis(left_count).each do |left_string|
            generate_parenthesis(n - 1 - left_count).each do |right_string|
                answer << "(" + left_string + ")" + right_string
            end
        end
    end

    return answer
end

class TestGenerateParenthesis < Test::Unit::TestCase
    def test_generate_parenthesis
        assert_equal(['()'], generate_parenthesis(1))
        assert_equal(["((()))","(()())","(())()","()(())","()()()"], generate_parenthesis(3))
        #assert_equal(['(())', '()()'], generate_parenthesis(2))
    end
end
