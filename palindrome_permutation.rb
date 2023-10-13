def is_palin_perm?(str)
    str.gsub!(/\s+/, "").downcase!

    d = {}
    str.each_char do |char|
        if d.key?(char)
            d[char] += 1
        else
            d[char] = 1
        end
    end

    odd_count = 0
    d.each_pair do |k, v|
        if v.odd? and odd_count == 0
            odd_count += 1
        elsif v.odd? and odd_count != 0
            return false
        end
    end
    return true
end

palin_perm = "Tact Coa"
not_palin_perm = "This is not a palindrome permutation"

puts(is_palin_perm?(palin_perm))
puts(is_palin_perm?(not_palin_perm))
