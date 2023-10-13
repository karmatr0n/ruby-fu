require 'test/unit'
# Given an array nums containing n distinct numbers in the range [0, n], return the only number in
# the range that is missing from the array.

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    expected_sum = (nums.length * (nums.length + 1)) / 2 #  Gauss' formula N(N+1)/2
    actual_sum = nums.sum
    return expected_sum - actual_sum
    # Time complexity: O(n)
    # Space complexity: O(1)
end

class TestMissingNumber < Test::Unit::TestCase
    def test_missing_number
        assert_equal(2, missing_number([3,0,1]))
        assert_equal(2, missing_number([0,1]))
        assert_equal(8, missing_number([9,6,4,2,3,5,7,0,1]))
        assert_equal(1, missing_number([0]))
    end
end
