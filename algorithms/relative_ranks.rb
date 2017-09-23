# https://leetcode.com/problems/relative-ranks/
#
# Given scores of N athletes, find their relative ranks and the people with the
# top three highest scores, who will be awarded medals: "Gold Medal",
# "Silver Medal" and "Bronze Medal".
#
# Example 1:
#
#     Input: [5, 4, 3, 2, 1]
#     Output: ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"]
#     Explanation: The first three athletes got the top three highest scores,
#     so they got "Gold Medal", "Silver Medal" and "Bronze Medal". For the
#     left two athletes, you just need to output their relative ranks according
#     to their scores.
#
# Note:
#
#     + N is a positive integer and won't exceed 10,000.
#     + All the scores of athletes are guaranteed to be unique.


# @param {Integer[]} nums
# @return {String[]}
def find_relative_ranks(nums)
  rank2str = Hash.new
  rank2str[1] =   'Gold Medal'
  rank2str[2] = 'Silver Medal'
  rank2str[3] = 'Bronze Medal'

  ranks = nums.dup
  nums.to_enum.with_index.map(&->(num, idx) { [num, idx] })
      .sort_by(&:first).reverse
      .each_with_index { |(_, idx), rank| ranks[idx] = rank2str.fetch(rank + 1, "#{rank + 1}") }
  ranks
end
