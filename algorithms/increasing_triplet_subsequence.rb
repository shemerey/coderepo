# https://leetcode.com/problems/increasing-triplet-subsequence/
#
# Given an unsorted array return whether an increasing subsequence of length
# 3 exists or not in the array.
#
# Formally the function should:
#
#     Return true if there exists i, j, k
#     such that arr[i] < arr[j] < arr[k] given 0 ≤ i < j < k ≤ n-1 else return false.
#
# Your algorithm should run in O(n) time complexity and O(1) space complexity.
#
# Examples:
#
#     Given [1, 2, 3, 4, 5], return true.
#     Given [5, 4, 3, 2, 1], return false.
#
# Credits:
#
#     Special thanks to @DjangoUnchained for adding this problem and creating
#     all test cases.


# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  return false if nums.empty?

  num1st, num2nd = nums[0], Float::INFINITY
  min = nums[0]

  nums.each do |num|
    return true if num > num2nd
    next if num == num2nd

    num1st, num2nd = min, num if num > min
    min = num if min > num
  end; false
end
