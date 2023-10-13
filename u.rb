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
end

def find_item_occurrences(array, p)
    count = 0
    array.each do |item|
        count += 1 if item == p
    end
    count
end

nums = [1, 2, 3, 4, 5]
result = product_except_self(nums)
puts result


a = [1, 2, 3, 4, 5, 3, 1, 3, 3, 3, 3, 3, 3, 3,1]
p = 3
#result = find_item_occurrences(a, 3)
#result = find_item_occurrences(a, 1)
result = find_item_occurrences(a, -1)
puts result

class Node
    attr_accessor :data, :next, :prev
    def initialize(data)
        @data = data
        @next = nil
        @prev = nil
    end
end


class LinkedList
    attr_reader :head, :tail, :length
    def initialize
        @head = nil
        @tail = nil
        @length = 0
    end

    def append(data)
        if @head.nil?
            @head = Node.new(data)
            @tail = @head
        else
            new_node = Node.new(data)
            @tail.next = new_node
            new_node.prev = @tail
            @tail = new_node
        end
        @length += 1
    end

    def print_list
        current_node = @head
        while current_node do
            puts current_node.data
            current_node = current_node.next
        end
        @length += 1
    end

    def add_into_the_middle(data)
        current_node = @head
        middle = (@length / 2) - 1
        middle.times do
            current_node = current_node.next
        end
        new_node = Node.new(data)
        new_node.prev = current_node
        new_node.next = current_node.next
        current_node.next = new_node
        current_node.next.prev = new_node
        @length += 1
    end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.add_into_the_middle(10)
list.add_into_the_middle(7)
list.add_into_the_middle(8)
list.add_into_the_middle(9)
puts "-----"
list.print_list

class TreeNode
    attr_accessor :data, :left, :right
    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end

def sorted_array_to_bst(array)
    return nil if array.empty?

    mid = array.length / 2
    root = TreeNode.new(array[mid])
    root.left = sorted_array_to_bst(array[0...mid])
    root.right = sorted_array_to_bst(array[mid+1..-1])
    root
end

puts "-----"
nums= [1, 2, 3, 4, 5, 6, 7]
root = sorted_array_to_bst(nums)
puts  root.data
puts  root.left.data
puts  root.right.data
