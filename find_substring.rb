require 'test/unit'

def find_substring(str, sub)
    i = 0
    j = 0
    while i < str.length do
        j += 1 if str[i] == sub[j]
        return i - j + 1 if j == sub.length
        i += 1
    end
    return -1
end

def find_substring3(str, sub)
    i = 0
    j = 0
    while i < str.length do
        j += 1 if str[i..sub.length+1] == sub[j]
        return i - j + 1 if j == sub.length
        i += 1
    end
    return -1
end

def find_substring2(str, sub)
    sub_length = sub.length - 1
    # using string slicing
    str.chars.each_index do | i|
        return i if str[i..i + sub_length] == sub
    end
    return -1
end

def find_substring3(str, sub)
    i = 0
    sub_length = sub.length - 1
    while i < str.length do
        return i if str[i..i + sub_length] == sub
        i += 1
    end
    return -1
end

class TestFindSubstring < Test::Unit::TestCase
    def test_find_substring
        assert_equal(2, find_substring('hello', 'll'))
        assert_equal(-1, find_substring('aaaaa', 'bba'))
        assert_equal(6, find_substring('thepigflewwow', 'flew'))
        assert_equal(-1, find_substring('wherearemyshorts', 'pork'))
        assert_equal(0, find_substring('twocanplay', 'two'))
    end

    def test_find_substring2
        assert_equal(2, find_substring2('hello', 'll'))
        assert_equal(-1, find_substring2('aaaaa', 'bba'))
        assert_equal(6, find_substring2('thepigflewwow', 'flew'))
        assert_equal(-1, find_substring2('wherearemyshorts', 'pork'))
        assert_equal(0, find_substring2('twocanplay', 'two'))
    end

    def test_find_substring3
        assert_equal(2, find_substring3('hello', 'll'))
        assert_equal(-1, find_substring3('aaaaa', 'bba'))
        assert_equal(6, find_substring3('thepigflewwow', 'flew'))
        assert_equal(-1, find_substring3('wherearemyshorts', 'pork'))
        assert_equal(0, find_substring3('twocanplay', 'two'))
    end
end
