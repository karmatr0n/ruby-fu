def integer_square_root(k)
    return k if k == 0 || k == 1

    low = 0
    high = k
    while low <= high do
        mid = (low + high) / 2
        mid_squared = mid * mid
        if mid_squared <= k
            low = mid + 1
        else
            high = mid - 1
        end
    end
    low - 1
end

puts(integer_square_root(300))
puts(integer_square_root(12))
