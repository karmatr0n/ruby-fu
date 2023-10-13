class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class CircularLinkedList
  attr_reader :head, :length
  def initialize
    @head = nil
    @length = 0
  end

  def prepend(data)
      new_node = Node.new(data)
      current_node = @head
      new_node.next = @head
      if @head.nil?
        new_node.next = @head
      else
        until current_node.next == @head do
            current_node = current_node.next
        end
        current_node.next = new_node
        @head = new_node
      end
      @length += 1
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
      @head.next = @head
    else
      new_node = Node.new(data)
      current_node = @head
      until current_node.next == @head do
        current_node = current_node.next
      end
      current_node.next = new_node
      new_node.next = @head
    end
    @length += 1
  end

  def remove(data)
    if @head.data == data
        current_node = @head.next
        until current_node.next == @head do
            current_node = current_node.next
        end
        current_node.next = @head.next
        @head = @head.next
    else
        current_node = @head
        until current_node.data == data do
            previous_node = current_node
            current_node = current_node.next
        end
        previous_node.next = current_node.next
    end
    @length -= 1
  end

  def length2
    current_node = @head
    count = 0
    while current_node do
        count += 1
        current_node = current_node.next
        break if current_node == @head
    end
    count
  end

  def print_list
    current_node = @head
    while current_node do
      puts current_node.data
      current_node = current_node.next
      break if current_node == @head
    end
  end

  def split_list
    return if @length.zero?
    return @head if @length == 1

    mid = @length / 2

    current_node = @head
    previous_node = nil
    count = 0
    while current_node and count < mid do
        previous_node = current_node
        current_node = current_node.next
        count += 1
    end
    previous_node.next = @head

    second_list = CircularLinkedList.new
    while current_node.next != @head do
        second_list.append(current_node.data)
        current_node = current_node.next
    end
    second_list.append(current_node.data)
    second_list.print_list
  end


  def remove_node(node)
    if @head == node
        current_node = @head.next
        until current_node.next == @head do
            current_node = current_node.next
        end

        current_node.next = @head.next
        @head = @head.next
  else
        current_node = @head
        previous_node = nil
        until current_node == node do
            previous_node = current_node
            current_node = current_node.next
        end
        previous_node.next = current_node.next
    end
    @length -= 1
  end

  def josephus_circle(step)
      current_node = @head
      while @length > 1 do
        count = 1
        until count == step do
            count += 1
            current_node = current_node.next
        end
        puts "KILL: #{current_node.data}"
        remove_node(current_node)
        current_node = current_node.next
      end
  end

  def circular_linked_list?
    return false if @head.nil?
    current_node = @head
    while current_node.next do
        current_node = current_node.next
        return true if current_node.next == @head
    end
    false
  end
end

my_list = CircularLinkedList.new
my_list.append('A')
my_list.append('B')
my_list.append('C')
my_list.append('D')
my_list.prepend('E')
my_list.print_list
my_list.remove('E')
my_list.remove('D')
my_list.remove('C')
my_list.print_list
puts(my_list.length)
puts(my_list.length2)

my_list.append('C')
my_list.append('D')
my_list.append('E')
my_list.print_list

puts('----')
puts(my_list.length)
my_list.split_list
my_list.print_list

puts('----')

cllist = CircularLinkedList.new
cllist.append(1)
cllist.append(2)
cllist.append(3)
cllist.append(4)
cllist.josephus_circle(2)
cllist.print_list
print(cllist.circular_linked_list?)
