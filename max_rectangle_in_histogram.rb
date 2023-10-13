require 'test/unit'
def max_rectangle_in_histogram(height)
    left = 0
       right = height.length - 1
       maxarea = 0
       while left < right do
           width = right - left
           min = [height[left], height[right]].min
           maxarea = [maxarea, min].max * width
           if height[left] <= height[right]
               left += 1
           else
               right -= 1
           end
       end
       return maxarea
end


class TestMaxRectangleInHistogram < Test::Unit::TestCase
    def test_max_rectangle_in_histogram
        assert_equal(6, max_rectangle_in_histogram([3, 1, 4, 2, 2]))
        assert_equal(12, max_rectangle_in_histogram([3, 1, 6, 7, 2]))
        assert_equal(30, max_rectangle_in_histogram([3, 1, 6, 7, 7, 7, 7, 2]))
    end
end
