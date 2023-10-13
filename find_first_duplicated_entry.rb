def find_first_duplicated_entry(array, target)
    low = 0
    high = array.length - 1
    while low <= high do
        mid = (low + high) / 2
        if array[mid] < target
            low = mid + 1
        elsif array[mid] > target
            high = mid - 1
        else
            return mid if mid - 1 < 0
            return mid if array[mid - 1] != target
            high = mid - 1
        end
    end
    return nil
end

def find_first_duplicated_entry_BF(array, target)
    array.each_with_index do |element, index|
        return index if element == target
    end
end

a = [-14, -10,2, 108, 108, 243, 285, 285, 285, 401]
target = 108
puts(find_first_duplicated_entry(a, target))
#puts(find_first_duplicated_entry_BF(a, target))
