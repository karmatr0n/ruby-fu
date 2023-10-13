require 'test/unit'
require 'set'

#You are given an array of logs. Each log is a space-delimited string of words, where the first word is the identifier.

# There are two types of logs:

# Letter-logs: All words (except the identifier) consist of lowercase English letters.
# Digit-logs: All words (except the identifier) consist of digits.
# Reorder these logs so that:
# 1. The letter-logs come before all digit-logs.
# 2. The letter-logs are sorted lexicographically by their contents. If their contents are the same, then sort
# them lexicographically by their identifiers.
# 3. The digit-logs maintain their relative ordering.
# Return the final order of the logs.

# @param {String[]} logs
# @return {String[]}
def reorder_log_files(logs)
    letter_logs = Set.new()
    digit_logs = Set.new()
    logs.each do |log|
        identifier, extracted_log = log.split(' ', 2)
        if extracted_log.match?(/^[a-zA-z\s]+$/)
            letter_logs.add([identifier, extracted_log])
        else
            digit_logs.add([identifier, extracted_log])
        end
    end
    letter_logs_sorted = letter_logs.sort_by { |k, v| [v, k] }
    letter_logs_sorted.map { |k, v| "#{k} #{v}" } + digit_logs.map { |k, v| "#{k} #{v}" }
end


class TestReorderLogFiles < Test::Unit::TestCase
    def test_reorder_log_files
        assert_equal(["let1 art can", "let3 art zero", "let2 own kit dig", "dig1 8 1 5 1", "dig2 3 6"], reorder_log_files(["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]))
        assert_equal(["g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"], reorder_log_files(["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]))
        assert_equal(["1 n u","r 527","j 893","6 14","6 82"], reorder_log_files(["1 n u", "r 527", "j 893", "6 14", "6 82"]))
    end
end
