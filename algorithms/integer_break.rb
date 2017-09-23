# https://leetcode.com/problems/integer-break/
#
# Given a positive integer n, break it into the sum of at least two positive
# integers and maximize the product of those integers. Return the maximum
# product you can get.
#
# For example:
#
#     given n = 2, return 1 (2 = 1 + 1);
#     given n = 10, return 36 (10 = 3 + 3 + 4).
#
# Note:
#
#     you may assume that n is not less than 2.
#
# Hint:
#
#     + There is a simple O(n) solution to this problem.
#     + You may check the breaking results of n ranging from 7 to 10 to
#       discover the regularities.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer} n
# @return {Integer}
def integer_break(n)
  return 1 if n <= 2
  return 2 if n == 3
  return 4 if n == 4

  dp = Array.new(n + 1)
  dp[2] = 2
  dp[3] = 3
  dp[4] = 4
  Range.new(5, n).each { |i| dp[i] = 3 * dp[i - 3] }

  dp[n]
end
