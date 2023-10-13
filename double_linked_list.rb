class Node
  attr_accessor :data, :next, :prev
  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end

class DoublyLinkedList
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

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
      @tail = @head
    else
       new_node = Node.new(data)
       @head.prev = new_node
       new_node.next = @head
       @head = new_node
    end
  end

  def add_after_node(prev_data, data)
      current_node = @head
      until current_node.data == prev_data do
        current_node = current_node.next
      end
      if current_node.next.nil?
        append(data)
      else
        new_node = Node.new(data)
        new_node.prev = current_node
        new_node.next = current_node.next
        current_node.next = new_node
        current_node.next.prev = new_node
        @length += 1
      end
  end

  def add_before_node(next_data, data)
      current_node = @head
      until current_node.data == next_data do
        current_node = current_node.next
      end

      if current_node.prev.nil?
          prepend(data)
      else
        new_node = Node.new(data)
        prev_node = current_node.prev
        prev_node.next = new_node
        new_node.prev = prev_node
        new_node.next = current_node
        current_node.prev = new_node
        @length += 1
      end
  end

  def print_list
    current_node = @head
    until current_node.nil? do
      puts current_node.data
      current_node = current_node.next
    end
  end

  def delete(data)
      if @head.data == data
        @head = @head.next
        @head.prev = nil unless @head.nil?
      elsif @tail.data == data
        @tail = @tail.prev
        @tail.next = nil unless @tail.nil?
      else
        current_node = @head
        until current_node.data == data do
          current_node = current_node.next
        end
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
      end
  end

  def reverse
      current_node = @head
      until current_node.nil? do
        temp = current_node.prev
        current_node.prev = current_node.next
        current_node.next = temp
        current_node = current_node.prev
      end
      @head = temp.prev unless temp.nil?
  end

  def remove_duplicates
      current_node = @head
      unique_data = {}
      until current_node.nil? do
        unless unique_data.key?(current_node.data)
            unique_data[current_node.data] = current_node
        else
            delete_node(current_node)
        end
        current_node = current_node.next
      end
  end

  def delete_node(node)
        if @head == node
            @head = node.next
            @head.prev = nil unless @head.nil?
        elsif @tail == node
            @tail = node.prev
            @tail.next = nil unless @tail.nil?
        else
            node.prev.next = node.next
            node.next.prev = node.prev
        end
    end

    def pairs_with_sum(sum)
        current_node = @head
        pair = []
        until current_node.nil? do
            pair << current_node.data
            if pair.sum == sum
                puts pair
                pair = []
            end
            current_node = current_node.next
        end
    end
end


dllist = DoublyLinkedList.new
dllist.prepend(0)
dllist.append(1)
dllist.append(2)
dllist.append(3)
dllist.append(4)
dllist.prepend(5)
dllist.add_after_node(3, 6)
dllist.add_after_node(4, 44)
# puts "-----------------"
# dllist.print_list()

puts "-----------------"
dllist.add_before_node(44, 444)
dllist.add_before_node(5, 555)
dllist.print_list()

dllist.delete(3)
dllist.delete(555)
puts "-----------------"
dllist.print_list()

puts "-----------------"
dllist.reverse()
dllist.print_list()

dllist2 = DoublyLinkedList.new
dllist2.append(1)
dllist2.delete(1)

dllist2.append(1)
dllist2.append(1)
dllist2.append(1)
dllist2.append(1)
dllist2.remove_duplicates()
puts "-----------------"
#dllist2.reverse()
dllist2.print_list()


dllist2 = DoublyLinkedList.new
dllist2.append(8)
dllist2.append(4)
dllist2.append(4)
dllist2.append(6)
dllist2.append(4)
dllist2.append(8)
dllist2.append(4)
dllist2.remove_duplicates()
puts "-----------------"
dllist2.print_list()


dllist = DoublyLinkedList.new
dllist.append(8)
dllist.append(4)
dllist.append(4)
dllist.append(6)
dllist.append(4)
dllist.append(8)
dllist.append(4)
dllist.append(10)
dllist.append(12)
dllist.append(12)
dllist.remove_duplicates()
puts "-----------------"
dllist.print_list()


dllist = DoublyLinkedList.new
dllist.append(1)
dllist.append(2)
dllist.append(3)
dllist.append(4)
dllist.append(5)
puts "-----------------"
puts(dllist.pairs_with_sum(5))
