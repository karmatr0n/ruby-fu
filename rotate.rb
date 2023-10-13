require 'test/unit'
# Desciption: Given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
# You have to rotate the image in-place, which means you have to modify the input 2D matrix directly.
# DO NOT allocate another 2D matrix and do the rotation.
#
def rotate(matrix)
    transpose(matrix)
    reflect(matrix)

    # Time complexity : O(M)
    # Space complexity : O(1)
end

def transpose(matrix)
   length = matrix.length
   (0...length).each do |i|
         (i+1...length).each do |j|
              matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
         end
    end
end

def reflect(matrix)
    length = matrix.length
    (0...length).each do |i|
        (0...(length/2)).each do |j|
            matrix[i][j], matrix[i][-j - 1] = matrix[i][-j - 1], matrix[i][j]
        end
    end
end

class TestRotate < Test::Unit::TestCase
    def test_rotate
        assert_equal([[7,4,1],[8,5,2],[9,6,3]], rotate([[1,2,3],[4,5,6],[7,8,9]]))
        #assert_equal([[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]], rotate([[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]))
    end
end
