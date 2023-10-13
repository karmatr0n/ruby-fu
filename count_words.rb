require 'test/unit'

def count_words(string)
    string.strip.split(' ').length
end

class TestCountWords < Test::Unit::TestCase
    def test_count_words
        assert_equal(3, count_words("I love ruby"))
        assert_equal(0, count_words(""))
        assert_equal(6, count_words("Ruby is awesome! Awesome programming language!"))
    end
end
