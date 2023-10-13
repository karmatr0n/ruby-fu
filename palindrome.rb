s = "Was it a cat I saw?"

s = s.each_char.select { |char| char.match?(/\A[a-zA-Z0-9]*\z/)}.join.downcase

puts(s == s.reverse())

def is_palindrome(str)
    i = 0
    j = str.length - 1
    while i < j do
        while i < j && !str[i].match?(/\A[a-zA-Z0-9]*\z/) do
            i += 1
        end

        while i < j && !str[j].match?(/\A[a-zA-Z0-9]*\z/) do
            j += 1
        end
        return false if str[i].downcase != str[j].downcase
        i += 1
        j -= 1
    end
    return true
end

puts(is_palindrome(s))
puts(is_palindrome('lola esta muy loca'))
puts "xxxx"
puts(is_palindrome('Taco Cat'))

def palindrome?(string)
    my_stack = []
    string.downcase.each_char do |char|
        my_stack.push(char) if char.match?(/[a-zA-Z0-9]/)
    end
    reversed_string = ""
    until my_stack.empty? do
         reversed_string += my_stack.pop
    end
    reversed_string == string.downcase.scan(/[a-zA-Z0-9]/).join
end


puts(palindrome?(s))
puts(palindrome?('lola esta muy loca'))

def palindrome3?(str)
  str = str.scan(/[a-zA-Z0-9]/).join.downcase
  left = 0
  right = str.length - 1
  while left < right do
    return false if str[left] != str[right]
    left += 1
    right -= 1
  end
  return true
end

puts 'xxx'
puts palindrome3?('level')  # true
puts palindrome3?('hello')  # false
puts palindrome3?('A man, a plan, a canal, Panama')  # true
puts palindrome3?('No lemon, no melon')  # true
puts palindrome3?('Taco Cat')  # true


require 'test/unit'

def palindrome1?(s)
  stack = []
  s.downcase.each_char do |c|
    stack.push(c) if c.match?(/[a-zA-z0-9]/)
  end

  reversed_string = ''
  until stack.empty? do
    reversed_string += stack.pop
  end
  return reversed_string == s.downcase.scan(/[a-zA-Z0-9]/).join
end

def palindrome2?(str)
  str = str.scan(/[a-zA-Z0-9]/).join.downcase
  left = 0
  right = str.length - 1
  while left < right do
    return false if str[left] != str[right]
    left += 1
    right -= 1
  end
  return true
end

def

class TestPalindrome < Test::Unit::TestCase
  def test_not_palindrome
    assert_equal(false, palindrome1?('This is just a test'))
  end

  def test_palindromes
    assert(palindrome1?('Was it a cat I saw?'))
    assert(palindrome1?('Sit on a potato pan, Otis'))
    assert(palindrome1?('Taco Cat'))
  end

  def test_not_palindrome2
    assert_equal(false, palindrome2?('This is just a test'))
  end

  def test_palindromes2
    assert(palindrome2?('Was it a cat I saw?'))
    assert(palindrome2?('Sit on a potato pan, Otis'))
    assert(palindrome2?('Taco Cat'))
  end
end
