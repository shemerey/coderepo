# https://leetcode.com/problems/remove-duplicate-letters/
#
# Given a string which contains only lowercase letters, remove duplicate letters
# so that every letter appear once and only once. You must make sure your result
# is the smallest in lexicographical order among all possible results.
#
# Example:
#
#     Given "bcabc"
#     Return "abc"
#
#     Given "cbacdcbc"
#     Return "acdb"
#
# Credits:
#
#     Special thanks to @peisi for adding this problem and creating all test
#     cases.


# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  m = ('a'..'z').each_with_object({}) { |ch, memo| memo[ch] = 0 }
  s.each_char { |ch| m[ch] += 1 }

  stack = []
  s.each_char do |ch|
    m[ch] -= 1

    next if stack.include?(ch)
    stack.pop until stack.empty? || m[stack[-1]].zero? || stack[-1] < ch
    stack.push(ch)
  end

  stack.join
end
