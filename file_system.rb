require 'debug'

module SomeCompany
  class FileFilter
    attr_reader :file, :attribute, :value
    def initialize(file, attribute, value)
      @file = file
      @attribute = attribute
      @value = value
    end

    def filtered?
      raise "implement the perform method in the #{self.class} class"
    end
  end

  class FilterEqualAttribute < FileFilter
    def filtered?
      file.send(attribute) == value
    end
  end

  class File
    attr_reader :name, :size, :ext, :kind, :children
    attr_accessor :content, :parent

    def initialize(name, size: 0, kind: :f, content: nil)
      @name = name
      @size = size
      @kind = kind
      @ext = name.match?(%r{.*\.\w+}) ? name.split('.').last : ''
      @children = []
      @parent = nil
      @content = content
    end

    def directory?
      kind == :d
    end

    def add_children(file)
      abort "Cannot add elements to a non-directory item" unless directory?
      file.parent = self
      @children.push(file)
      @size += file.size
    end

    def find_by_name(name)
      children.find {|child| child.name == name}
    end

    def full_path
      parent_dir = parent
      tree_elements = [parent_dir]
      until parent_dir.nil? do
        parent_dir = parent_dir.parent
        tree_elements.push(parent_dir)
      end
      path = tree_elements.compact.reverse.map(&:name)
      path.push(name)
      path.join('/').gsub(/\/+/, '/')
    end

    def recursive_find(options: {})
      children.each do |child|
        child.recursive_find(options: options) if child.directory?
        puts child.full_path if found_child?(child, options)
      end
    end

    def found_child?(child, filter_options={})
      filter_options.all? do |attribute, filtered_value|
        FilterEqualAttribute.new(child, attribute, filtered_value).filtered?
      end
    end
  end

  class FileSystem
    attr_reader :root, :delimiter, :current_directory
    def initialize(name='/')
      @root = File.new(name, kind: :d)
      @delimiter = '/'
      @current_directory = @root
    end

    def mkdir(path)
      tree_components = path.split(delimiter)
      dir = File.new(tree_components.shift, kind: :d)
      @current_directory.add_children(dir)
      tree_components.each do |component|
          sub_dir = File.new(component, kind: :d)
          dir.add_children(sub_dir)
          dir = sub_dir
      end
    end

    def cd(path)
      tree_components = path.gsub(/\/+/, '/').split(delimiter)
      parent_component = tree_components.shift
      parent_dir = (parent_component.nil? || parent_component.empty?) ? @root : @current_directory.find_by_name(parent_component)
      abort "Directory does not exist" if parent_dir.nil?
      tree_components.each do |component|
          sub_dir = parent_dir.find_by_name(component)
          parent_dir = sub_dir unless sub_dir.nil?
      end
      @current_directory = parent_dir
    end

    def create_file(name, size: 0, content: nil)
      file = File.new(name, size:, content:)
      @current_directory.add_children(file)
    end

    def ls(path=nil)
      @current_directory.children.each do |child|
        puts child.name
      end
    end

    def cat(name)
      file = @current_directory.find_by_name(name)
      abort "File does not exist" if file.nil?
      puts file.content
    end

    def find(options={})
      @current_directory.recursive_find(options: options)
    end
  end
end


fs = SomeCompany::FileSystem.new
fs.mkdir('a/b/c/d')
fs.cd('a/b/c/d')
fs.create_file('test1.txt', size: 5)
fs.create_file('test2.txt', size: 5)
fs.create_file('test3.txt', size: 10, content: 'Content for file 3')
fs.create_file('test4.pdf', size: 10)
# #fs.cat('test3.txt')
fs.cd('/a/b/c')
fs.create_file('test5.txt', size: 10)
# #fs.ls
fs.find(ext: 'txt', size: 5)
fs.find(ext: 'txt', size: 10)
fs.find(ext: 'pdf', size: 10)
#puts fs.current_directory
#debugger
class BTreeNode
  attr_accessors :keys, :children, :leaf

  def initialize(order)
    @order = order
    @keys = []
    @children = []
    @leaf = true
  end
end

# class BTree
#   def initialize(order)
#     @root = BTreeNode.new(order)
#     @order = order #Maximum number of children a non-root node can have
#   end

#   def insert(key)
#     root  = @root
#     if root.keys.size == (2 * @order) - 1
#     end
