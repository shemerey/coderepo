# https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
#
# Given an array of integers where 1 <= a[i] <= n (n = size of array), some
# elements appear twice and others appear once. Find all the elements of
# [1, n] inclusive that do not appear in this array.
#
# Could you do it without extra space and in O(n) runtime? You may assume the
# returned list does not count as extra space.
#
# Example:
#
#     Input: [4,3,2,7,8,2,3,1]
#     Output: [5,6]


# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  nums.each_with_index do |_, i|
    idx = nums[i].abs - 1
    nums[idx] = -nums[idx].abs
  end

  [].tap do |result|
    nums.each_with_index do |n, i|
      result << (i + 1) if n > 0
    end
  end
end
