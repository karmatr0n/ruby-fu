require 'pry'
require 'test/unit'

def longest_palindrome(s)
   dp = [[false] * s.length] * s.length
   #dp = [[False]*len(s) for _ in range(len(s)) ]
   j = 0
   s.chars.each_index do |i|
         #j = 0 if j == (s.length - 1)
         dp[i][i] = true

         #j += 1
   end
   binding.pry
end
       # for i in range(len(s)):
       #     dp[i][i]=True
       # ans=s[0]
       # for j in range(len(s)):
       #     for i in range(j):
       #         if s[i]==s[j] and (dp[i+1][j-1] or j==i+1):
       #             dp[i][j]=True
       #             if j-i+1>len(ans):
       #                 ans=s[i:j+1]
       # return ans

def palindrome?(str)
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

class TestClass < Test::Unit::TestCase
    # def test_biggest_palindrome
    #     palindromes = [
    #         "civic",
    #         "radar",
    #         "level",
    #         "rotor",\]
    #         "hannah",
    #         "Sit on a potato pan, Otis",
    #         "Cigar? Toss it in a can. It is so tragic.",
    #         "Go hang a salami, I'm a lasagna hog.",
    #         "Taco cat",
    #         "Nun",
    #         "No palindromes here"
    #     ]
    #     asert_equal("Cigar? Toss it in a can. It is so tragic.", biggest_palindrome(palindromes))
    # end

    def test_longest_palindrome
        assert_equal("bbb", longest_palindrome("abbba"))
    end
end
