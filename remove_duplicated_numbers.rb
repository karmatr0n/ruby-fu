require 'test/unit'

def remove_duplicates(nums)
    return 0 if nums.empty?

    i = 1
    insert_index = 1
    while i < nums.length do
        if nums[i] != nums[i - 1]
            nums[insert_index] = nums[i]
            insert_index +=1
        end
        i += 1
    end
    return insert_index
    # Time complexity: O(n)
    # Space complexity: O(1)
end

class TestRemoveDuplicates < Test::Unit::TestCase
    def test_remove_duplicates
        assert_equal(2, remove_duplicates([1, 1, 2]))
        assert_equal(6, remove_duplicates([1, 2, 3, 3, 3, 4, 4, 4, 5, 5,6]))
        assert_equal(5, remove_duplicates([0,0,1,1,1,2,2,3,3,4]))
    end
end
