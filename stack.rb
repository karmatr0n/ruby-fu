class Stack
  attr_reader :stack

  def initialize
     @stack = []
  end

  def push(item)
    stack.push(item)
  end

  def pop
    stack.pop
  end

  def peek
    stack.last unless empty?
  end

  def empty?
    stack.empty?
  end

  def size
    stack.size
  end
end

my_stack = Stack.new
my_stack.push('A')
my_stack.push("A")
my_stack.push("B")
my_stack.push("C")
puts my_stack.stack

def balanced?(brackets)
   return false if brackets.length.odd? || brackets.length.zero?
   my_stack = []
   brackets.each_char do |bracket|
       if '{[('.include?(bracket)
          my_stack.push(bracket)
        else
          top = my_stack.pop
          return false unless match?(top, bracket)
        end
    end
    my_stack.empty?
end

def match?(p1, p2)
    (p1 == '{' && p2 == '}') || (p1 == '[' && p2 == ']') || (p1 == '(' && p2 == ')')
end

brackets = '{[()]}'
puts balanced?(brackets)
brackets = '((())'
puts balanced?(brackets)
brackets = '{{[([({})])]}}'
puts balanced?(brackets)
brackets = '{{[([({}))]}}'
puts balanced?(brackets)
brackets = '{{[([({})])}}}'
puts balanced?(brackets)


def reverse_string(string)
    my_stack = Stack.new

    string.each_char do |char|
        my_stack.push(char)
    end

    reversed_string = ""
    until my_stack.empty? do
        reversed_string += my_stack.pop
    end
    reversed_string

end

puts reverse_string("Hello World!")
puts reverse_string("!dlroW olleH")

def decimal_to_binary(number)
    return "0" if number.zero?
    my_stack = Stack.new
    while number > 0 do
        my_stack.push(number % 2)
        number /= 2
    end

    binary = []
    until my_stack.empty? do
        binary.push(my_stack.pop)
    end
    binary.join
end

puts decimal_to_binary(26)
puts decimal_to_binary(33)

palindromes = [
    "civic",
    "radar",
    "level",
    "rotor",
    "kayak",
    "reviver",
    "racecar",
    "madam",
    "refer",
    "wow",
    "hannah",
    "Sit on a potato pan, Otis",
    "Cigar? Toss it in a can. It is so tragic.",
    "Go hang a salami, I'm a lasagna hog.",
    "Taco cat",
    "Nun",
    "No palindromes here"
]

def palindrome?(string)
    my_stack = Stack.new
    string.downcase.each_char do |char|
        my_stack.push(char) if char.match(/[a-z]/)
    end
    reversed_string = ""
    until my_stack.empty? do
         reversed_string += my_stack.pop
    end
    reversed_string == string.downcase.scan(/[a-z]/).join
end
puts palindromes.select {|word| palindrome?(word)}

puts palindromes.reject {|word| palindrome?(word)}

def move_zeros(nums)
    return nums if nums.empty?
    left = 0
    right = nums.length - 1
    while left < right do
        if nums[left] == 0
            nums[left], nums[right] = nums[right], nums[left]
            right -= 1
        else
            left += 1
        end
    end
    nums
end

nums = [0, 1, 0, 0, 0, 0, 1, 2, 3, 4, 0, 1, 5, 7 ]

result = move_zeros(nums)
puts result.inspect
