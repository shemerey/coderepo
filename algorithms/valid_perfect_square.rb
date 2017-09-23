# https://leetcode.com/problems/valid-perfect-square/
#
# Given a positive integer num, write a function which returns True if num is a
# perfect square else False.
#
# Note: Do not use any built-in library function such as sqrt.
#
# Example 1:
#
#     Input: 16
#     Returns: True
#
# Example 2:
#
#     Input: 14
#     Returns: False
#
# Credits: Special thanks to @elmirap for adding this problem and creating all
# test cases.


# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  xn = 1.0
  while (xn * xn - num).abs > 0.1
    xn = (xn + num / xn) / 2
  end

  xn = xn.truncate
  xn * xn == num
end
