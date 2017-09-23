# https://leetcode.com/problems/first-unique-character-in-a-string/
#
# Given a string, find the first non-repeating character in it and return it's
# index. If it doesn't exist, return -1.
#
# Examples:
#
#     s = "leetcode"
#     return 0.
#
#     s = "loveleetcode",
#     return 2.
#
# Note: You may assume the string contain only lowercase letters.


# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  m = Hash.new { |h, k| h[k] = 0 }
  s.each_char { |c| m[c] += 1 }
  m.each { |k, v| return s.index(k) if v == 1 }; return -1
end
