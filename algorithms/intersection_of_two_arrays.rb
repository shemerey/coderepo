# https://leetcode.com/problems/intersection-of-two-arrays/
#
# Given two arrays, write a function to compute their intersection.
#
# Example: Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
#
# Note:
#
#     + Each element in the result must be unique.
#     + The result can be in any order.


# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
  counter = Hash.new { |h, k| h[k] = 0 }

  [].tap do |res|
    nums1.each { |n| counter[n] = 1 }
    nums2.each { |n| res << n if (counter[n] -= 1) >= 0 }
  end
end
