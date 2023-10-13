
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class BST
  def initialize(data)
      @root = Node.new(data)
  end

  def insert(data)
      insert_node(@root, data)
  end

  def insert_node(current, data)

    if current.data < data
        if current.right.nil?
            current.right = Node.new(data)
        else
            insert_node(current.right, data)
        end
    else
        if current.left.nil?
            current.left = Node.new(data)
        else
            insert_node(current.left, data)
        end
    end
  end

  def search(data)
      search_node(@root, data)
  end

  def search_node(current, data)
      return false if current.nil?
      return true if current.data == data
      if current.data < data
          search_node(current.right, data)
      else
          search_node(current.left, data)
      end
  end

  def bst_satisfies?
    bst_satisfies_node?(@root)
  end

  def bst_satisfies_node?(node,  min = -1.0/0, max = 1.0/0)
    return true if node.nil?

    return false if node.data < min || node.data > max
    return bst_satisfies_node?(node.left, min, node.data) && bst_satisfies_node?(node.right, node.data, max)
  end
end

# bst = BST.new(2)
# bst.insert(1)
# bst.insert(3)
# bst.insert(4)
# bst.insert(56)
# bst.insert(13)

# puts(bst.search(9))
# puts(bst.search(14))
# x= bst.bst_satisfies?
# puts x
