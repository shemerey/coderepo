# https://leetcode.com/problems/burst-balloons/
#
# Given n balloons, indexed from 0 to n-1. Each balloon is painted with a
# number on it represented by array nums. You are asked to burst all the
# balloons. If the you burst balloon i you will get
# nums[left] * nums[i] * nums[right] coins. Here left and right are adjacent
# indices of i. After the burst, the left and right then becomes adjacent.
#
# Find the maximum coins you can collect by bursting the balloons wisely.
#
# Note:
#
#     + You may imagine nums[-1] = nums[n] = 1. They are not real therefore
#       you can not burst them.
#     + 0 <= n <= 500, 0 <= nums[i] <= 100
#
# Example:
#
#     Given [3, 1, 5, 8]
#     Return 167
#
#      nums = [3,1,5,8] --> [3,5,8] --> [  3,8] --> [  8  ] --> []
#     coins =  3*1*5     +   3*5*8   +   1*3*8   +   1*8*1   =  167
#
# Credits:
#
#     Special thanks to @peisi for adding this problem and creating all test
#     cases.


# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
  nums = [1, *nums, 1]
  memo = Array.new(nums.size) { Array.new(nums.size) }

  _max_coins_(nums, 0, nums.size - 1, memo)
end

private def _max_coins_(nums, lbound, ubound, memo)
  return 0 if ubound - lbound == 1
  return memo[lbound][ubound] if memo[lbound][ubound]

  coins = 0
  Range.new(lbound + 1, ubound - 1).each do |i|
    c = _max_coins_(nums, lbound, i, memo) +
        _max_coins_(nums, i, ubound, memo) +
        nums[lbound] * nums[i] * nums[ubound]
    coins = c if coins < c
  end

  memo[lbound][ubound] = coins
  return coins
end
