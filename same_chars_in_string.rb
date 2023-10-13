require 'test/unit'
require 'set'

def has_same_chars?(string1, string2)
    string1.chars.to_set == string2.chars.to_set
end

class TestSameChars < Test::Unit::TestCase
    def test_same_chars
        assert_equal(true, has_same_chars?("google", "ooggle"))
        assert_equal(true, has_same_chars?("google", "oogglle"))
        assert_equal(true, has_same_chars?("abc", "cab"))
        assert_equal(true, has_same_chars?("abc", "ccbbaabbcc"))
        assert_equal(false, has_same_chars?("google", "google1"))
        assert_equal(false, has_same_chars?("1122", "11"))

    end
end
