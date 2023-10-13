#
#
# alex = 1
# mirtha = 1
# juan = 2
# alex = 3
# roxana = 4
# alex = 2
# mirtha = 10
class AVLNode
  attr_accessor :key, :value, :height, :left, :right

  def initialize(key, value)
    @key = key
    @value = value
    @height = 1
    @left = nil
    @right = nil
  end
end

class AVLTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  # Insert a key-value pair
  def insert(key, value)
    @root = insert_recursive(@root, key, value)
  end

  # Delete a key-value pair by key
  def delete(key)
    @root, _ = delete_recursive(@root, key)
  end

  def in_order_traversal(node = @root, &block)
    return if node.nil?

    in_order_traversal(node.left, &block)
    yield node if block_given?
    in_order_traversal(node.right, &block)
  end

  private

  def insert_recursive(node, key, value)
    return AVLNode.new(key, value) if node.nil?

    if value > node.value # Note the descending order
      node.left = insert_recursive(node.left, key, value)
    else
      node.right = insert_recursive(node.right, key, value)
    end

    update_height(node)
    balance(node)
  end

  def delete_recursive(node, key)
    return [nil, nil] if node.nil?

    deleted_node = nil

    if key == node.key
      deleted_node = node

      return [node.right, deleted_node] if node.left.nil?
      return [node.left, deleted_node] if node.right.nil?

      min_larger_node = find_min(node.right)
      node.key, node.value = min_larger_node.key, min_larger_node.value
      node.right, _ = delete_recursive(node.right, min_larger_node.key)
    elsif key < node.key
      node.left, deleted_node = delete_recursive(node.left, key)
    else
      node.right, deleted_node = delete_recursive(node.right, key)
    end

    return [nil, deleted_node] if node.nil?

    update_height(node)
    [balance(node), deleted_node]
  end

  def find_min(node)
    node = node.left until node.left.nil?
    node
  end

  def balance(node)
    # Left heavy
    if balance_factor(node) > 1
      node.left = rotate_left(node.left) if balance_factor(node.left) < 0
      return rotate_right(node)
    end

    # Right heavy
    if balance_factor(node) < -1
      node.right = rotate_right(node.right) if balance_factor(node.right) > 0
      return rotate_left(node)
    end

    node
  end

  def rotate_left(node)
    new_root = node.right
    node.right = new_root.left
    new_root.left = node
    update_height(node)
    update_height(new_root)
    new_root
  end

  def rotate_right(node)
    new_root = node.left
    node.left = new_root.right
    new_root.right = node
    update_height(node)
    update_height(new_root)
    new_root
  end


  def height(node)
    node ? node.height : 0
  end

  def balance_factor(node)
    height(node.left) - height(node.right)
  end

  def update_height(node)
    node.height = [height(node.left), height(node.right)].max + 1
  end
end

class UserLog
  def initialize
    @users = Hash.new(0)
    @tree = AVLTree.new
  end

  def set(login, value)
    @tree.delete(login) if @users.key?(login)
    @users[login] += value.to_i
    @tree.insert(login, @users[login])
  end

  def print_descending
    @tree.in_order_traversal do |node|
      puts "Key: #{node.key}, Value: #{node.value}"
    end
  end
end

users = UserLog.new
users.set('a', 10)
users.set('b', 20)
users.set('c', 5)
users.set('a', 40)

# O(log n)
# Print the key-value pairs in ascending order of keys
users.print_descending
