# https://leetcode.com/problems/longest-palindrome/
#
# Given a string which consists of lowercase or uppercase letters, find the
# length of the longest palindromes that can be built with those letters. This
# is case sensitive, for example "Aa" is not considered a palindrome here.
#
# Note: Assume the length of given string will not exceed 1,010.
#
# Example:
#
#     Input: "abccccdd"
#     Output: 7
#     Explanation: One longest palindrome that can be built is "dccaccd", whose
#     length is 7.


# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  m = Hash.new { |h, k| h[k] = 0 }
  s.each_char { |c| m[c] += 1 }

  count = m.any? { |_, v| v.odd? } ? 1 : 0
  m.each { |_, v| count += v / 2 * 2 }
  count
end
