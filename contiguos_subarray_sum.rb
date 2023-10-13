require 'test/unit'
def find_subarray_sum(array, target)
    return false if array.length > 100_000
    i = 0
    j = 0
    sum = array[i]
    while i <= j && j < array.length do
        if sum == target && sum >= 0 && sum <= 1_000_000_000
            return true
        elsif sum < target
            j += 1
            sum += array[j] if j < array.length
        else
            sum -= array[i]
            i += 1
        end
    end

    return false
end

def has_subarray_sum?(array, n)
    sums_map = { 0 => true}
    sum = 0
    array.each do |element|
        sum += element
        return true if sums_map.key?(sum - n)
        sums_map[sum] = true
    end
    return false
end

class TestFindSubarraySum < Test::Unit::TestCase
    def test_find_subarray_sum
        assert(find_subarray_sum([1, 2, 3, 4], 5))
        assert(find_subarray_sum([1, 2, 3, 4], 10))
        assert(find_subarray_sum([3, 7, 4], 11))
        assert(find_subarray_sum([3, 7, 4, 1, 6, 8, 2, 9, 0], 16))
        assert(find_subarray_sum([1, 2, 1_000_000_000], 1_000_000_000))
        assert(find_subarray_sum([1, 2, 4, 1_000_000_000 - 4], 1_000_000_000))
        assert(find_subarray_sum([3, 7, 8, 1, 6, 8, 2, 9, 0], 15))
    end

    def test_not_subarray_sum
        assert_equal(false, find_subarray_sum([1, 2, 4], 5))
        assert_equal(false, find_subarray_sum([2, 3, 4], 10))
        assert_equal(false, find_subarray_sum([3, 7, 4, 1, 6, 8, 9, 2, 0], 16))
        assert_equal(false, find_subarray_sum([1, 2, 3, 1_000_000_000], 1_000_000_004))
        assert_equal(false, find_subarray_sum([1, 2, 3, 1_000_000_000], 1_000_000_003))
    end

    def test_has_subarray_sum
        assert(has_subarray_sum?([1, 2, 3, 4, 6, -1], 5))
        assert(has_subarray_sum?([1, 2, 3, 4], 10))
        assert(has_subarray_sum?([3, 7, 4], 11))
        assert(has_subarray_sum?([3, 7, 4, 1, 6, 8, 2, 9, 0], 16))
        assert(has_subarray_sum?([1, 2, 1_000_000_000], 1_000_000_000))
        assert(has_subarray_sum?([1, 2, 4, 1_000_000_000 - 4], 1_000_000_000))
        assert(has_subarray_sum?([3, 7, 8, 1, 6, 8, 2, 9, 0], 15))
    end

    def test_not_subarray_sum
        assert_equal(false, has_subarray_sum?([1, 2, 4], 5))
        assert_equal(false, has_subarray_sum?([2, 3, 4], 10))
        assert_equal(false, has_subarray_sum?([3, 7, 4, 1, 6, 8, 9, 2, 0], 16))
        assert_equal(false, has_subarray_sum?([1, 2, 3, 1_000_000_000], 1_000_000_004))
        assert_equal(false, has_subarray_sum?([1, 2, 3, 1_000_000_000], 1_000_000_003))
    end
end
