def rbisect(array, target)
    low = 0
    high = array.length - 1
    while low <= high do
        mid = (low + high) / 2
        if array[mid] > target
            high = mid - 1
        else
            low = mid + 1
        end
    end
    low - 1
end


def lbisect(array, target)
    low = 0
    high = array.length - 1
    while low <= high do
        mid = (low + high) / 2
        if target > array[mid]
            high = mid - 1
        else
            low = mid + 1
        end
    end
    low
end

puts (rbisect([1,2,4,4,3,3,3,3,3,3,3,4,5], 4))

puts (lbisect([1,2,4,4,3,3,3,3,3,3,3,4,5], 4))
