require 'test/unit'

# Given a string paragraph and a string array of the banned words banned, return the most frequent word that is not banned.
# It is guaranteed there is at least one word that is not banned, and that the answer is unique.

def most_common_word(paragraph, banned)
    max_occurance = 0
    ans = ""
    word_buffer = []
    word_count = Hash.new(0)
    paragraph.chars.each_with_index do |char, index|
        word_buffer << char.downcase if char.match?(/[a-zA-Z0-9]/)
        if word_buffer.length > 0 && (char.match?(/[^a-zA-Z0-9]/) || index == paragraph.length - 1)
            word = word_buffer.join("")
            if banned.none?(word)
                word_count[word]  += 1
                if word_count[word] > max_occurance
                    max_occurance = word_count[word]
                    ans = word
                end
            end
            word_buffer = []
        end
    end
    return ans

    # Time Complexity: O(N+M)
    # Space Complexity: O(N+M)
end

class TestMostCommonWord < Test::Unit::TestCase
    def test_most_common_word
        assert_equal("ball", most_common_word("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"]))
        assert_equal("ball", most_common_word("Bob.  hIt, baLl", ["bob", "hit"]))
    end
end
