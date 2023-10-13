require 'test/unit'

def digits_only?(string)
    return false if string.empty?
    string.chars.all? { |char| char.ord >= '0'.ord && char.ord <= '9'.ord }
    # or use a regex like this:
    # string.match?(/\A\d+\z/)
end

class TestDigitsOnly < Test::Unit::TestCase
    def test_digits_only
        assert_equal(true, digits_only?("123"))
        assert_equal(false, digits_only?("123a"))
        assert_equal(false, digits_only?(""))
    end
end
