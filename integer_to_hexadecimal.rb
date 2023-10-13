require 'test/unit'

def integer_to_hex(n)
    return '0' if n.zero?
    hex_digits = '0123456789ABCDEF'
    result = ''
    while n > 0 do
        result << hex_digits[n % 16]
        n /= 16
    end
    result.reverse
end

class TestIntegerToHex < Test::Unit::TestCase
    def test_integer_to_hex
        assert_equal('0', integer_to_hex(0))
        assert_equal('10', integer_to_hex(16))
        assert_equal('100', integer_to_hex(256))
        assert_equal('3E8', integer_to_hex(1000))
    end
end
