require 'test/unit'

# You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of
# the ith line are (i, 0) and (i, height[i]).

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    left = 0
    right = height.length - 1
    maxarea = 0
    while left < right do
        width = right - left
        current_area = [height[left], height[right]].min * width
        maxarea  = [maxarea, current_area].max
        if height[left] < height[right]
            left += 1
        else
            right -= 1
        end
    end
    return maxarea

    # Time complexity: O(n)
    # Space complexity: O(1)
end

class TestMaxArea < Test::Unit::TestCase
    def test_max_area
        assert_equal(49, max_area([1,8,6,2,5,4,8,3,7]))
        assert_equal(1, max_area([1,1]))
        assert_equal(24, max_area([3, 1, 6, 7, 7, 7, 7, 2]))
    end
end
