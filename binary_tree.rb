class TreeNode
    attr_accessor :data, :left, :right
    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(value)
        @queue.unshift(value)
    end

    def dequeue
        @queue.pop unless empty?
    end

    def empty?
        @queue.empty?
    end

    def peek
        @queue.last
    end

    def size
        @queue.length
    end
end

class Stack
    def initialize
        @stack =[]
    end

    def push(value)
        @stack.push(value)
    end

    def pop
        @stack.pop unless empty?
    end

    def empty?
        @stack.empty?
    end

    def peek
        @stack.last
    end

    def size
        @stack.length
    end

    def to_s
        @stack.map {|item| "#{item}-" }.join
    end
end

class BinaryTree
    attr_reader :root
    def initialize(root)
        @root = TreeNode.new(root)
    end

    def preorder_print(node, traversal)
        unless node.nil?
            traversal += "#{node.data}-"
            traversal = preorder_print(node.left, traversal)
            traversal = preorder_print(node.right, traversal)
        end
        traversal
    end

    def inorder_print(node, traversal)
        unless node.nil?
            traversal = inorder_print(node.left, traversal)
            traversal += "#{node.data}-"
            traversal = inorder_print(node.right, traversal)
        end
        traversal
    end

    def postorder_print(node, traversal)
       unless node.nil?
           traversal = postorder_print(node.left, traversal)
           traversal = postorder_print(node.right, traversal)
           traversal += "#{node.data}-"
       end
       traversal
    end

    def tree_length(node)
        return if node.nil?

        left_length = tree_length(node.left)
        right_length = tree_length(node.right)
        return left_length.to_i + right_length.to_i + 1
    end

    def level_order_traversal(node)
        return if node.nil?
        queue = Queue.new
        queue.enqueue(node)
        traversal = ""
        until queue.empty? do
            traversal += "#{queue.peek.data}-"
            node = queue.dequeue()
            queue.enqueue(node.left) unless node.left.nil?
            queue.enqueue(node.right) unless node.right.nil?
        end
        traversal
    end

    def reverse_level_order(node)
        return if node.nil?
        queue = Queue.new
        stack = Stack.new
        queue.enqueue(node)
        traversal = ""
        until queue.empty? do
            node = queue.dequeue()
            stack.push(node)
            queue.enqueue(node.right) unless node.right.nil?
            queue.enqueue(node.left) unless node.left.nil?
        end

        until stack.empty? do
            node = stack.pop
            traversal += "#{node.data}-"
        end
        traversal
    end

    def height(node)
        return -1 if node.nil?
        left_height = height(node.left)
        right_height = height(node.right)
        return [left_height, right_height].max + 1
    end

    def size(node)
        return 0 if node.nil?
        left_size = size(node.left)
        right_size = size(node.right)
        return left_size + right_size + 1
    end
end

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def tree_length(node)
  return 0 if node.nil?

  left_length = tree_length(node.left)
  right_length = tree_length(node.right)

  return 1 + left_length + right_length
end


tree = BinaryTree.new(1)
tree.root.left = TreeNode.new(2)
tree.root.right = TreeNode.new(3)
tree.root.left.left = TreeNode.new(4)
tree.root.left.right = TreeNode.new(5)
tree.root.right.left = TreeNode.new(6)
tree.root.right.right = TreeNode.new(7)

class Queue
end
puts tree.tree_length(tree.root)
puts "-----"
puts tree.preorder_print(tree.root, "")
puts "-----"
puts tree.inorder_print(tree.root, "")


puts "-----"
puts tree.postorder_print(tree.root, "")

puts "-----"
tree = BinaryTree.new(1)
tree.root.left = TreeNode.new(2)
tree.root.right =  TreeNode.new(3)
tree.root.left.left =  TreeNode.new(4)
tree.root.left.right =  TreeNode.new(5)
puts tree.level_order_traversal(tree.root)

puts tree.reverse_level_order(tree.root)
puts "-----"
puts tree.height(tree.root)


puts "-----"
puts tree.size(tree.root)
# puts "-----"
# puts tree.postorder_print(tree.root, "")

#CODING ON DSA AND THEY ARE VERY MUCH STANDARD QUESTIONS,
# LCA OF THE BINARY TREE
# K DISTANCE NODES FROM CURRENT NODE

# DO YOU HAVE ANY QUESTIONS FOR US
