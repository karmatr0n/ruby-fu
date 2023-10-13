def find_index(array)
    low = 0
    high = array.length - 1

    while low <= high do
        mid = (low + high) / 2
        if array[mid] > array[high]
            low = mid + 1
        elsif array[mid] >= array[low]
            high = mid - 1
        end
    end

    return low
end

A = [4, 5, 6, 7,  0, 1, 2, 3]
idx = find_index(A)
puts(idx)
puts(A[idx])
