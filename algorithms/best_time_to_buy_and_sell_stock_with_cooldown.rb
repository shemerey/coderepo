# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
#
# Say you have an array for which the ith element is the price of a given stock
# on day i. Design an algorithm to find the maximum profit. You may complete as
# many transactions as you like (ie, buy one and sell one share of the stock
# multiple times) with the following restrictions:
#
#     + You may not engage in multiple transactions at the same time (ie, you
#       must sell the stock before you buy again).
#     + After you sell your stock, you cannot buy stock on next day. (ie,
#       cooldown 1 day)
#
# Example:
#
#     prices = [1, 2, 3, 0, 2]
#     maxProfit = 3
#     transactions = [buy, sell, cooldown, buy, sell]
#
# Credits:
#
#     Special thanks to @peisi for adding this problem and creating all test
#     cases.


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.empty?

  hold = Array.new(prices.size + 1, -prices[0])
  sell = Array.new(prices.size + 1, 0)
  prices.each_with_index do |price, idx|
    hold[idx + 1] = [hold[idx], sell[idx - 1] - price].max
    sell[idx + 1] = [sell[idx], hold[idx] + price].max
  end

  sell[-1]
end
