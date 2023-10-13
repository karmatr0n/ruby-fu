s1 = "google"
s2 = "ooggle"
not_permutation_1 = "not"
not_permutation_2 = "top"

def is_perm1(s1, s2)
    return false if s1.length != s2.length
    s1.downcase.chars.sort == s2.downcase.chars.sort
end


def is_perm2(s1, s2)
    return false if s1.length != s2.length
    s1.downcase!
    s2.downcase!

    dict = Hash.new(0)
    s1.each_char do |c|
        if dict.key?(c)
            dict[c] += 1
        else
            dict[c] = 1
        end
    end
    s2.each_char do |c|
        dict[c] -= 1 if dict.key?(c)
    end

    return dict.all? {|_k, v| v == 0}
end
puts is_perm1(s1, s2)
puts is_perm1(not_permutation_1, not_permutation_2)

puts is_perm2(s1, s2)
puts is_perm2(not_permutation_1, not_permutation_2)
