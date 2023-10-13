def binary_search_iterative(data, target)
    low = 0
    high = data.length - 1
    while low <= high do
        mid = (low + high) / 2
        if data[mid] == target
            return true
        elsif data[mid] < target
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return false
end

def binary_search_recursive(data, target)
    return false if data.empty?
    mid = data.length / 2
    if target == data[mid]
        return true
    elsif target > data[mid]
        binary_search_recursive(data[mid + 1..-1], target)
    else
        binary_search_iterative(data[0..mid], target)
    end
end

data = [2,4,5,7,8,9,12,14,17,19,22,25,27,28,33,37]
target = 5

puts(binary_search_iterative(data, target))
puts(binary_search_recursive(data, target))
