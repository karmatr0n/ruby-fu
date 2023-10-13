class Node
    attr_accessor :value, :next
    def initialize(value)
        @value = value
        @next = nil
    end
end

class LinkedList
    attr_reader :head
    def initialize
        @head = nil
    end

    def append(value)
        node = Node.new(value)
        if head.nil?
            @head = node
            return
        end

        current = self.head
        until current.next.nil? do
            current = current.next
        end
        current.next = node
    end

    def print_list
        current = head
        until current.nil? do
            puts current.value
            current = current.next
        end
    end

    def insert_after(prev_node, value)
        unless prev_node
            puts "Previous node must be in the list."
            return
        end
        node = Node.new(value)
        node.next = prev_node.next
        prev_node.next = node
    end

    def prepend(value)
        node = Node.new(value)
        node.next = head
        @head = node
    end
end

linked_list = LinkedList.new
linked_list.append("A")
linked_list.append("B")
linked_list.append("C")
linked_list.insert_after(linked_list.head.next, "D")
linked_list.prepend("E")
linked_list.print_list()
