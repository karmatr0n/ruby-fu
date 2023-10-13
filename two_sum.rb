require 'test/unit'
# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# You can return the answer in any order.
#
def two_sum(nums, target)
    k = {}
    nums.each_with_index do |num, i|
        return [k[num], i] if k.key?(num)
        k[target - num] = i
    end

    # Time complexity: O(n2)
    # Space complexity: O(1)
end

class TestTwoSum < Test::Unit::TestCase
    def test_two_sum
        assert_equal([0, 1], two_sum([2, 7, 11, 15], 9))
        assert_equal([1, 2], two_sum([3,2,4], 6))
    end
end
