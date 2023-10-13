require 'test/unit'
def integer_to_sixtytwo(n)
    return '0' if n.zero?
    sixtytwo_digits = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    result = ''
    while n > 0 do
        result << sixtytwo_digits[n % 62]
        n /= 62
    end
    result.reverse
end

class TestIntegerToSixtyTwo < Test::Unit::TestCase
    def test_integer_to_sixty_two
        assert_equal('0', integer_to_sixtytwo(0))
        assert_equal('1', integer_to_sixtytwo(1))
        assert_equal('8hl7c', integer_to_sixtytwo(122343434))
        assert_equal('3KXFG2Wm', integer_to_sixtytwo(13232322343434))
    end
end
