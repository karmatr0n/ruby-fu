
def recursive_multiply(a, b)
    return 0 if a == 0 || b == 0
    return a + recursive_multiply(a, b-1 ) if b > 0
    return -recursive_multiply(a, -b) if b < 0
end

puts(recursive_multiply(5, 3))

puts(recursive_multiply(5, -5))

puts(recursive_multiply(500, 2000))
