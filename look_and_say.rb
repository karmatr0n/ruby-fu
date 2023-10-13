
def next_number(s)
    result = []
    i = 0
    while i < s.length # s = "11", s = "21"
        count = 1
        while i + 1 < s.length && s[i] == s[i + 1] do
            i += 1
            count += 1
        end
        result.push(count.to_s + s[i])
        i += 1
    end

    result.join
end

s = "1"
#puts(next_number(s))
3.times do
    puts("-----------------")
    puts(s)
    s = next_number(s)
    puts(s)
end
