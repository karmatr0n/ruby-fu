s1 = "fairy tales"
s2 = "rail safety"
s3 = "rail safetx"

s1 = s1.gsub(/\s/, "").downcase()
s2 = s2.gsub(/\s/, "").downcase()

puts(s1.each_char.sort == s2.each_char.sort)

def anagram?(str1, str2)
    return false if str1.length != str2.length
    dict = { }
    str1.each_char do |char|
        if dict.has_key?(char)
            dict[char] += 1
        else
            dict[char] = 1
        end
    end

    str2.each_char do |char|
        if dict.has_key?(char)
            dict[char] -= 1
        else
            dict[char] = 1
        end
    end
    dict.each_key do |k|
        return false if dict[k] != 0
    end
    return true
end

puts(anagram?(s1, s2))
puts(anagram?(s1, s3))
