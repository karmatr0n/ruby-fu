require 'test/unit'

def remove_char_from_string(string, c)
    string.delete(c)
end

class TestRemoveCharFromString < Test::Unit::TestCase
    def test_remove_char_from_string
        assert_equal('abbdjfkd', remove_char_from_string("abcbcdjfkd", 'c'))
        assert_equal('accdjfkd', remove_char_from_string("abcbcdjfkd", 'b'))
        assert_equal('abcbcdjfkd', remove_char_from_string("abcbcdjfkd", 'x'))
    end
end
