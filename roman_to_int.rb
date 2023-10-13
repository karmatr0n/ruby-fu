require 'test/unit'
# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
def roman_to_int(roman)
    roman_symbols = {
        'M'  => 1000,
        'CM' => 900,
        'D'  => 500,
        'CD' => 400,
        'C'  => 100,
        'XC' => 90,
        'L'  => 50,
        'XL' => 40,
        'X'  => 10,
        'IX' => 9,
        'V'  => 5,
        'IV' => 4,
        'I'  => 1
    }
    num = 0
    i = 0
    while i < roman.length  do
        j = i + 1
        if j < roman.length && roman_symbols.key?(roman[i] + roman[j])
            num += roman_symbols[roman[i] + roman[j]]
            i += 2
        else
            num += roman_symbols[roman[i]]
            i += 1
        end
    end
    return num
    # Time complexity: O(1)
    # Space complexity: O(1)
end

class TestRomanToInt < Test::Unit::TestCase
    def test_roman_to_int
     assert_equal(1, roman_to_int('I'))
     assert_equal(3, roman_to_int('III'))
     assert_equal(4, roman_to_int('IV'))
     assert_equal(671, roman_to_int('DCLXXI'))
     assert_equal(58, roman_to_int('LVIII'))
     assert_equal(1994, roman_to_int('MCMXCIV'))
    end
end
