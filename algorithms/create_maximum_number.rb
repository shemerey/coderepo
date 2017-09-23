# https://leetcode.com/problems/create-maximum-number/
#
# Given two arrays of length m and n with digits 0-9 representing two numbers.
# Create the maximum number of length k <= m + n from digits of the two. The
# relative order of the digits from the same array must be preserved. Return an
# array of the k digits. You should try to optimize your time and space
# complexity.
#
# Example 1:
#
#     nums1 = [3, 4, 6, 5]
#     nums2 = [9, 1, 2, 5, 8, 3]
#     k = 5
#     return [9, 8, 6, 5, 3]
#
# Example 2:
#
#     nums1 = [6, 7]
#     nums2 = [6, 0, 4]
#     k = 5
#     return [6, 7, 6, 0, 4]
#
# Example 3:
#
#     nums1 = [3, 9]
#     nums2 = [8, 9]
#     k = 3
#     return [9, 8, 9]
#
# Credits:
#
#     Special thanks to @dietpepsi for adding this problem and creating all
#     test cases.


# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[]}
def max_number(nums1, nums2, k)
  max = []
  Range.new([0, k - nums2.size].max, [k, nums1.size].min).each do |spt|
    ns1 = _max_number_(nums1, spt)
    ns2 = _max_number_(nums2, k - spt)

    submax = []
    submax << [ns1, ns2].max.shift until ns1.empty? || ns2.empty?
    submax.concat(ns1).concat(ns2)

    max = [max, submax].max
  end
  max
end

private def _max_number_(nums, k)
  stack = []
  nums.each_with_index do |num, idx|
    stack.pop while nums.size - idx + stack.size > k && stack[-1] && stack[-1] < num
    stack.push(num) if stack.size < k
  end
  stack
end
