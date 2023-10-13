require 'test/unit'

def find_duplicated_words(string)
    words_with_counter = Hash.new(0)
    string.downcase.split(' ').each do |word|
        words_with_counter[word] += 1
    end
    words_with_counter.select { |_k, v| v > 1 }.keys
end

class TestSimpleNumber < Test::Unit::TestCase
    def test_find_duplicated_words
        assert_equal(['the'], find_duplicated_words('The dog is the best'))
        assert_equal(['is', 'too'], find_duplicated_words('The house is too big and it is also too expensive'))
    end

    def test_not_duplicated_words
        assert_equal([], find_duplicated_words('The house is too small'))
    end
end
