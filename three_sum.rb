require 'test/unit'
require 'set'

# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k,
# and nums[i] + nums[j] + nums[k] == 0.


# @param {Integer[]} nums
# @return {Integer[][]}

def three_sum(nums)
    res = Set.new
    dups = Set.new
    seen = {}
    nums.each_with_index do |num1, i|
        if dups.none?(num1)
            dups.add(num1)
            nums[i+1..].each_with_index do |num2, j|
                complement = -(num1) - num2
                if seen.key?(complement) && seen[complement] == i
                    res.add([num1, complement, num2].sort)
                end
                seen[num2] = i
            end
        end
    end
    res.to_a
    # Time complexity: O(n^2)
    # Space complexity: O(n)
end

class TestThreeSum < Test::Unit::TestCase
    def test_three_sum
        assert_equal([[-1, 0, 1], [-1, -1, 2]], three_sum([-1,0,1,2,-1,-4]))
        assert_equal([], three_sum([0,0,1]))
        assert_equal([[0,0,0]], three_sum([0,0,0]))
    end
end
