# https://leetcode.com/problems/top-k-frequent-elements/
#
# Given a non-empty array of integers, return the k most frequent elements.
#
# For example:
#
#     Given [1, 1, 1, 2, 2, 3] and k = 2, return [1, 2].
#
# Notes:
#
#     + You may assume k is always valid, 1 <= k <= number of unique elements.
#     + Your algorithm's time complexity must be better than O(nlogn), where
#       n is the array's size.


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  m = Hash.new { |hash, key| hash[key] = 0 }
  nums.each { |n| m[n] -= 1 }
  m.sort_by(&:last).take(k).map(&:first)
end
