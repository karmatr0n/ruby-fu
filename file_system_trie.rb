require 'test/unit'
require 'debug'

class TrieNode
  attr_accessor :children, :value
  def initialize(children: {}, value: nil)
    @children = children
    @value = value
  end
end

class FileSystem
  def initialize
    @root = TrieNode.new
  end

  def create_path(path, value)
    elements = path.split('/')
    node = @root
    elements[1..].each do |element|
       node.children[element] ||= TrieNode.new
       node = node.children[element]
    end

    return false unless node.value.nil?
    node.value = value
    return true
  end

  def get_path(path)
    elements = path.split('/')
    node = @root
    elements[1..].each do |element|
        return -1 unless node.children.key?(element)
        node = node.children[element]
    end
    return node.value || -1
  end
end

class TestFileSystem < Test::Unit::TestCase
  def test_file_system_1
    fs = FileSystem.new
    assert(fs.create_path("/a", 1))
    assert_equal(1, fs.get_path('/a'))
  end

  def test_file_system_2
    fs = FileSystem.new
    assert(fs.create_path("/leet", 1))
    assert(fs.create_path("/leet/code", 2))
    assert_equal(1, fs.get_path('/leet'))
    assert_equal(2, fs.get_path('/leet/code'))
    assert_equal(-1, fs.get_path('/leet/code/foo'))
    assert_equal(-1, fs.get_path('/leet2/code'))
  end
end
