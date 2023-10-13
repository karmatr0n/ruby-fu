require 'test/unit'
# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
def int_to_roman(num)
    roman_symbols = {
        1000 => 'M',
        900  => 'CM',
        500  => 'D',
        400  => 'CD',
        100  => 'C',
        90   => 'XC',
        50   => 'L',
        40   => 'XL',
        10   => 'X',
        9    => 'IX',
        5    => 'V',
        4    => 'IV',
        1    => 'I'

    }
    roman_numeral = ''
    roman_symbols.each do |value, symbol|
        break if num.zero?
        counter, num = num.divmod(value)
        roman_numeral << (symbol * counter)
    end
    return roman_numeral
    # Space complexity: O(1)
    # Time complexity: O(1)
end

class TestIntToRoman < Test::Unit::TestCase
    def test_int_to_roman
        assert_equal('I', int_to_roman(1))
        assert_equal('III', int_to_roman(3))
        assert_equal('IV', int_to_roman(4))
        assert_equal('DCLXXI', int_to_roman(671))
    end
end
