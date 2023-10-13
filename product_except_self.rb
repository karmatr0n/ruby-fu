require 'test/unit'
# Given an integer array nums, return an array answer such that answer[i] is equal to the product of
# all the elements of nums except nums[i].

# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
#
# You must write an algorithm that runs in O(n) time and without using the division operation.
def product_except_self(array)
  n = array.length
  output = Array.new(n, 1)
  left_product = 1
  (0...n).each do |i|
    output[i] *= left_product
    left_product *= array[i]
  end

  right_product = 1
  (n-1).downto(0).each do |i|
    output[i] *= right_product
    right_product *= array[i]
  end
  output

 # Time complexity: O(n)
 # Space complexity: O(1)
end

nums = [1, 2, 3, 4]
result = product_except_self(nums)
puts result
