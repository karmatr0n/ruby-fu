require 'set'
def unique_chars?(str)
    chars = Set.new
    str.each_char do |char|
        chars.include?(char) ? (return false) : chars << char
    end
    return true
end

puts unique_chars?("abCDefGh")
puts unique_chars?("I Am Not Unique")
puts unique_chars?("hi")
