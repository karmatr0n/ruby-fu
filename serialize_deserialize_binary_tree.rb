require 'test/unit'
require 'debug'
require_relative '../bst'

def serialize(root, str='')
    if root.nil?
        str += 'null,'
    else
        str += root.val.to_s + ','
        str = rserialize(root.left, str)
        str = rserialize(root.right, str)
    end
    return str
end

def deserialize(data)
end

class TestSerialize < Test::Unit::TestCase
  def test_serialize
    bts = BST.new(1)
    bts.insert(2)
    bts.insert(3)
    bts.insert(nil)
    bts.insert(nil)
    bts.insert(4)
    bts.insert(5)
    debugger
  end
end
