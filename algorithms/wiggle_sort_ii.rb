# https://leetcode.com/problems/wiggle-sort-ii/
#
# Given an unsorted array nums, reorder it such that nums[0] < nums[1] > nums[2] < nums[3]....
#
# Example:
#
#     + Given nums = [1, 5, 1, 1, 6, 4], one possible answer is [1, 4, 1, 5, 1, 6].
#     + Given nums = [1, 3, 2, 2, 3, 1], one possible answer is [2, 3, 1, 3, 1, 2].
#
# Note:
#
#     You may assume all input has valid answer.
#
# Follow Up:
#
#     Can you do it in O(n) time and/or in-place with O(1) extra space?
#
# Credits:
#
#     Special thanks to @dietpepsi for adding this problem and creating all
#     test cases.


# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
  sorted, midd = nums.sort, (nums.size - 1) / 2
  nums.map!.with_index { |_, i| sorted[(i.even? ? midd : -1) - i / 2] }; nil
end
