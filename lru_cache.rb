# Builder accepts with capacity with a positive number.
# For any other value it raises an exception and stops execution
#
# Get method fetches the cached value for the key and increase the use time for that.
# Puts adds or updates the key, if the capacity is exceded, we must evict the least recently used key.
#
#
require 'time'
require 'test/unit'
require 'debug'

class Node
  attr_accessor :key, :value, :next, :prev
  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
    @prev = nil
  end
end

class LRUCache
  attr_reader :capacity, :head, :tail, :dict
  def initialize(capacity)
    @capacity = capacity
    @dict = {}
    @head = Node.new(-1, -1)
    @tail = Node.new(-1, -1)
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    return -1 unless dict.key?(key)
    node = dict[key]
    remove(node)
    add(node)
    return node.value
  end

  def put(key, value)
    if dict.include?(key)
      old_node = dict[key]
      remove(old_node)
    end

    node = Node.new(key, value)
    dict[key] = node
    add(node)

    if dict.size > capacity
      node_to_delete = head.next
      dict.delete(node_to_delete.key)
      remove(node_to_delete)
    end
  end

  def add(node)
    prev_end = tail.prev
    prev_end.next = node
    node.prev = prev_end
    node.next = tail
    tail.prev = node
  end

  def remove(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end
end

class TestLRUCache < Test::Unit::TestCase
  def test_lru
    cache = LRUCache.new(2)
    cache.put(1, 1)
    cache.put(2, 2)
    cache.get(1)
    cache.put(3, 3)
    assert_equal(-1, cache.get(2))
    cache.put(4, 4)
    assert_equal(-1, cache.get(1))
    assert_equal(3, cache.get(3))
    assert_equal(4, cache.get(4))
  end
end
