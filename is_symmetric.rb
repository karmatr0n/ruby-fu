
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
    return mirror?(root, root)
    # Time: O(n)
    # Space: O(n)
end

def mirror?(t1, t2)
    return true if t1.nil? && t2.nil?
    return false if t1.nil? || t2.nil?
    return t1.val == t2.val && mirror?(t1.right, t2.left) && mirror?(t1.left, t2.right)
end

# Approach 2:Iterative

# Instead of recursion, we can also use iteration with the aid of a queue.
# Each two consecutive nodes in the queue should be equal, and their
# subtrees a mirror of each other. Initially, the queue contains root
# and root.
# Time complexity : O(n). Because we traverse the entire input
# tree once, the total run time is O(n), where nnn is the total
# number of nodes in the tree.
# Space complexity : There is additional space required for the search queue.
# In the worst case, we have to insert O(n) nodes in the queue. Therefore,
# space complexity is O(n).
def is_symmetric(root)
    queue = []
    queue.push(root)
    queue.push(root)
    until queue.empty? do
        t1 = queue.shift
        t2 = queue.shift
        next if t1.nil? && t2.nil?
        return false if t1.nil? || t2.nil?
        return false if t1.val != t2.val
        queue.push(t1.left)
        queue.push(t2.right)
        queue.push(t1.right)
        queue.push(t2.left)
    end
    return true
end
