require 'test/unit'

def text_justification(words, max_width)
    lines = []
    line = []
    line_length = 0
    words.each do |word|
        if line_length + word.length + line.length <= max_width
            line_length += word.length
            line << word
        else
            lines << line
            line = [word]
            line_length = word.length
        end
    end
    lines << line
    lines.map do |line|
        if line.length == 1
            line[0] + ' ' * (max_width - line[0].length)
        else
            spaces = max_width - line.join('').length
            spaces_per_word = spaces / (line.length - 1)
            extra_spaces = spaces % (line.length - 1)
            line.join(' ' * spaces_per_word) + ' ' * extra_spaces
        end
    end.join("\n")
end

class TestTextJustification < Test::Unit::TestCase
    def test_text_justification
        wordsLonger = [
            'algodaily',
            'is',
            'awesome',
            'and',
            'you',
            'can',
            'text',
            'justify',
            'all',
            'types',
            'of',
            'text',
            'and',
            'words',
          ]
          result =
              "algodaily  \n" +
              "is  awesome\n" +
              "and you can\n" +
              "text       \n" +
              "justify all\n" +
              "types    of\n" +
              "text    and\n" +
              "words      "
        puts result
        puts text_justification(wordsLonger, 11)
        assert_equal(result, text_justification(wordsLonger, 11))
    end
end
