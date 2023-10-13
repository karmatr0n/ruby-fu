def move_zeros(array)
    return array if array.empty?
    left = 0
    right = array.length - 1
    while left < right do
        if array[left] == 0
            array[left], array[right] = array[right], array[left]
            right -= 1
        else
            left += 1
        end
    end
    array
end

nums = [0, 1, 0, 0, 0, 0, 1, 2, 3, 4, 0, 1, 5, 7 ]

result = move_zeros(nums)
puts result.inspect
