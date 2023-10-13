def find_closest_number(array, target)
    return -1 if array.empty?
    return array.first if array.length == 1
    left = 0
    right = array.length - 1
    closest = nil

    while left <= right do
        mid = (left + right) / 2
        return array[mid] if array[mid] == target
        if array[mid] > target
            right = mid - 1
        else
            left = mid + 1
        end

        #print "left: #{left}, right: #{right}, mid: #{mid}, mid_value: #{array[mid]}\n"
        #print "(#{target} - #{array[mid]}).abs < (#{target} - #{closest}).abs\n"
        if closest.nil? || (target - array[mid]).abs < (target - closest).abs
            closest = array[mid]
        end
    end
    closest
end

a1 = [1, 2, 4, 5, 6, 6, 8, 9]
a2 = [2, 5, 6, 7, 8, 8, 9]
puts(find_closest_number(a1, 7))
#puts(find_closest_number(a2, 4))
