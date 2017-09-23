# https://leetcode.com/problems/sum-of-two-integers/
#
# Calculate the sum of two integers a and b, but you are not allowed to use the
# operator + and -.
#
# Example:
#
#   Given a = 1 and b = 2, return 3.
#
# Credits: Special thanks to @fujiaozhu for adding this problem and creating all
# test cases.


# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
  return b if a.zero?
  return a if b.zero?

  until b.zero?
    carry = a & b
    a = a ^ b
    b = carry << 1
  end

  a
end
