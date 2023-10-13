# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
#
# Recursive solution with valid Range
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(node,  min = -Float::INFINITY, max = Float::INFINITY)
    return true if node.nil?

    return false if node.val <= min || node.val >= max
    return is_valid_bst(node.left, min, node.val) && is_valid_bst(node.right, node.val, max)
 end

# Iterative solution with valid Range
#  The above recursion could be converted into iteration, with the help of an explicit stack. DFS would be better than BFS since it works faster here.
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
    return true if root.nil?
    stack  = []
    stack.push([root, -Float::INFINITY, Float::INFINITY])
    until stack.empty? do
        node, min, max = stack.pop
        return false if node.val <= min || node.val >= max
        stack.push([node.left, min, node.val]) unless node.left.nil?
        stack.push([node.right, node.val, max]) unless node.right.nil?
    end
    return true
end

# Inorder traversal
# @param {TreeNode} root
@prev = -Float::INFINITY
def is_valid_bst(node)
     return true if node.nil?
     return false unless is_valid_bst(node.left)
     return false if node.val <= @prev
     @prev = node.val
     return is_valid_bst(node.right)
 end
