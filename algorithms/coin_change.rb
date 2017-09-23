# https://leetcode.com/problems/coin-change/
#
# You are given coins of different denominations and a total amount of money
# amount. Write a function to compute the fewest number of coins that you need
# to make up that amount. If that amount of money cannot be made up by any
# combination of the coins, return -1.
#
# Example 1:
#
#     coins = [1, 2, 5], amount = 11
#     return 3 (11 = 5 + 5 + 1)
#
# Example 2:
#
#     coins = [2], amount = 3
#     return -1.
#
# Note:
#
#     You may assume that you have an infinite number of each kind of coin.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  c = _coin_change_(coins.sort, amount, {})
  c == Float::INFINITY ? -1 : c
end

private def _coin_change_(coins, amount, memo)
  return 0 if amount.zero?
  return memo[amount] if memo.key?(amount)

  min = Float::INFINITY
  coins.reverse_each do |coin|
    next if amount - coin < 0
    c = _coin_change_(coins, amount - coin, memo)
    min = c + 1 if min > c + 1
  end

  memo[amount] = min
  return min
end
