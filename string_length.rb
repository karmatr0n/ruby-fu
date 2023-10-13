def iterative_string_length(string)
    return 0 if string == ''
    count = 0
    string.each_char do |char|
        count += 1
    end
    count
end

def recursive_string_length(string)
    return 0 if string == ''
    return 1 + recursive_string_length(string[1..])
end

input_str = "LucidProgramming"
puts(iterative_string_length(input_str))
puts(recursive_string_length(input_str))
