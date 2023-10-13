require 'test/unit'
# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
# A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
#
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    filtered_digits = digits.each_char.filter {|number| number != '1'}
    return [] if filtered_digits.empty?
    return map_digit(filtered_digits[0]) if filtered_digits.length == 1
    recursive_combinations(filtered_digits[0], filtered_digits[1..])
end

def recursive_combinations(current_digit, other_digits)
    return map_digit(current_digit) if other_digits.empty?
    return map_digit(current_digit)
        .product(recursive_combinations(other_digits[0], other_digits[1..]))
        .map(&:join)
end

def map_digit(digit)
    digit_mappings = {
        "1" => %w[∞],
        "2" => %w[a b c],
        "3" => %w[d e f],
        "4" => %w[g h i],
        "5" => %w[j k l],
        "6" => %w[m n o],
        "7" => %w[p q r s],
        "8" => %w[t u v],
        "9" => %w[w x y z],
        "0" => %w[_]
    }
    digit_mappings.fetch(digit, [])
end

class TestLetterCombinations < Test::Unit::TestCase
    def test_letter_combinations
        assert_equal(["ad","ae","af","bd","be","bf","cd","ce","cf"], letter_combinations("23"))
        assert_equal([], letter_combinations(""))
        assert_equal(["a","b","c"], letter_combinations("2"))
        assert_equal(["adg",
         "adh",
         "adi",
         "aeg",
         "aeh",
         "aei",
         "afg",
         "afh",
         "afi",
         "bdg",
         "bdh",
         "bdi",
         "beg",
         "beh",
         "bei",
         "bfg",
         "bfh",
         "bfi",
         "cdg",
         "cdh",
         "cdi",
         "ceg",
         "ceh",
         "cei",
         "cfg",
         "cfh",
         "cfi"],
            letter_combinations("234"))
    end
end
