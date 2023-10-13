def iterative_count_consonants(string)
    vowels = "aeiou"
    count = 0
    string.each_char do |char|
        count += 1 unless vowels.include?(char.downcase)
    end
    count
end


def recursive_count_consonants(string, index =0)
    vowels = "aeiou"
    count = 0
    return count if string == ''

    count += 1 unless vowels.include?(string[index].downcase)
    index == string.length - 1 ? count : count + recursive_count_consonants(string, index + 1)
end

input_str = "abc de"
puts(input_str)
puts(iterative_count_consonants(input_str))
puts(recursive_count_consonants(input_str))

input_str = "LuCiDPrograMMiNG"
puts(input_str)
puts(iterative_count_consonants(input_str))
puts(recursive_count_consonants(input_str))
