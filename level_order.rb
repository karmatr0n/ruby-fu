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
# @return {Integer[][]}
def level_order(root)
    return [] if root.nil?
    queue = Array.new
    queue.unshift(root)
    levels = []
    level = 0
    until queue.empty? do
        levels[level] = []
        0.upto(queue.size - 1).each do
            levels[level].push(queue.last.val)
            node = queue.pop
            queue.unshift(node.left) unless node.left.nil?
            queue.unshift(node.right) unless node.right.nil?
        end
        level +=1
    end
    levels
end
