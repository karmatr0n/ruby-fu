def find_fixed_number(array)
    return nil if array.empty?
    return array.first if array.length == 1
    low = 0
    high = array.length - 1
    while low <= high do
        mid = (low + high) / 2
        return array[mid] if array[mid] == mid
        if array[mid] > mid
            high = mid - 1
        else
            low = mid + 1
        end
    end
    return nil
end

# Fixed point is 3:
a1 = [-10, -5, 0, 3, 7]
puts(find_fixed_number(a1))
# Fixed point is 0:
a2 = [0, 2, 5, 8, 17]
puts(find_fixed_number(a2))
# No fixed point. Return nil:
a3 = [-10, -5, 3, 4, 7, 9]
puts(find_fixed_number(a3))
