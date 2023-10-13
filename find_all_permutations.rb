require 'test/unit'

def find_all_permutations(string)
    return [string] if string.length == 1

    permutations = []
    string.each_char.with_index do |char, index|
        remaining_chars = string[0...index] + string[(index + 1)..-1]
        sub_permutations = find_all_permutations(remaining_chars)
        sub_permutations.each { |permutation| permutations << char + permutation }
    end
    permutations
end

class TestFindAllPermutations < Test::Unit::TestCase
    def test_find_all_permutations
        assert_equal(["abc", "acb", "bac", "bca", "cab", "cba"], find_all_permutations("abc"))
        abcd_results = [
         "abcd",
         "abdc",
         "acbd",
         "acdb",
         "adbc",
         "adcb",
         "bacd",
         "badc",
         "bcad",
         "bcda",
         "bdac",
         "bdca",
         "cabd",
         "cadb",
         "cbad",
         "cbda",
         "cdab",
         "cdba",
         "dabc",
         "dacb",
         "dbac",
         "dbca",
         "dcab",
         "dcba"
        ]
        assert_equal(abcd_results, find_all_permutations("abcd"))
    end
end
