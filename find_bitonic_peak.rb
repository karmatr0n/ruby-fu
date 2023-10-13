def find_bitonic_peak(array)
    low = 0
    high = array.length - 1

    return nil if array.length < 3

    while low <= high do
        mid = (low + high) / 2
        mid_left = mid - 1 >= 0 ?  array[mid - 1] : -Float::INFINITY
        mid_right = mid + 1 < array.length ?  array[mid + 1] : Float::INFINITY

        if mid_left < array[mid] && array[mid] > mid_right
            return array[mid]
        elsif mid_left < array[mid] && array[mid] < mid_right
            low = mid + 1
        else
            high = mid - 1
        end
    end

    return nil
end
a1 = [1, 2, 3, 4, 5, 4, 3, 2, 1]
a2 = [1, 6, 5, 4, 3, 2, 1]
a3 = [1, 2, 3, 4, 5]
a4 = [5, 4, 3, 2, 1]


puts(find_bitonic_peak(a1))
puts(find_bitonic_peak(a2))
puts(find_bitonic_peak(a3))
puts(find_bitonic_peak(a4))
