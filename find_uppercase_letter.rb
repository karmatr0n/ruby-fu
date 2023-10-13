def find_uppercase_iterative(string)
    return "String should not be empty" if string.length == 0
    string.each_char do |c|
        return c if c == c.upcase
    end
    return "No uppercase character found"
end

def find_uppercase_recursive(string, index = 0)
    return "String should not be empty" if string.length == 0
    return "No uppercase character found" if index >= string.length
    return string[index] if string[index] == string[index].upcase
    return find_uppercase_recursive(string, index + 1)
end

s1 = "lucidProgramming"
s2 = "LucidProgramming"
s3 = "lucidprogramming"
puts(find_uppercase_iterative(s1))
puts(find_uppercase_iterative(s2))
puts(find_uppercase_iterative(s3))

puts(find_uppercase_recursive(s1))
puts(find_uppercase_recursive(s2))
puts(find_uppercase_recursive(s3))
