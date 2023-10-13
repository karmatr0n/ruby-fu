require 'test/unit'
# Given an array of strings strs, group the anagrams together. You can return the answer in any order.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically
# using all the original letters exactly once.

def group_anagrams(strs)
    grouped_anagrams = Hash.new { |hash, key| hash[key] = [] }
    strs.each do |s|
        count = [0] * 26
        s.each_char do |c|
            count[c.ord - 'a'.ord] += 1
        end
        group_key = count.join('_')
        grouped_anagrams[group_key].push(s)
    end
    return grouped_anagrams.values
    # Time complexity: O(NK)
    # Space complexity: O(NK)
end

class TestGroupAnagrams < Test::Unit::TestCase
    def test_group_anagrams
        assert_equal([["bat"],["nat","tan"],["ate","eat","tea"]], group_anagrams(["eat","tea","tan","ate","nat","bat"]))
        assert_equal([["bbbbbbbbbbc"],["bdddddddddd"]], group_anagrams(["bdddddddddd","bbbbbbbbbbc"]))
        #assert_equal([[""]], group_anagrams([""]))
        #assert_equal([["a"]], group_anagrams(["a"]))
    end
end
