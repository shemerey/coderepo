# https://leetcode.com/problems/count-of-range-sum/
#
# Given an integer array nums, return the number of range sums that lie in
# [lower, upper] inclusive. Range sum S(i, j) is defined as the sum of the
# elements in nums between indices i and j (i ≤ j), inclusive.
#
# Note:
#
#     A naive algorithm of O(n2) is trivial. You MUST do better than that.
#
# Example:
#
#     Given nums = [-2, 5, -1], lower = -2, upper = 2, Return 3. The three
#     ranges are : [0, 0], [2, 2], [0, 2] and their respective sums are:
#     -2, -1, 2.
#
# Credits:
#
#     Special thanks to @dietpepsi for adding this problem and creating all
#     test cases.


# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_range_sum(nums, lower, upper)
  _count_range_sum_(
    nums.each_with_object([0], &->(num, memo){ memo << memo[-1] + num }),
    0, nums.size + 1,
    lower, upper
  )
end

private def _count_range_sum_(sums, lbound, ubound, lower, upper)
  return 0 if ubound - lbound <= 1

  middle = (lbound + ubound) / 2
  count = _count_range_sum_(sums, lbound, middle, lower, upper) +
          _count_range_sum_(sums, middle, ubound, lower, upper)

  j, k = middle, middle
  r, s = [], middle
  lbound.upto(middle - 1) do |i|
    k += 1 while k < ubound && sums[k] - sums[i] <  lower
    j += 1 while j < ubound && sums[j] - sums[i] <= upper
    count += j - k

    while s < ubound && sums[s] < sums[i]
      r << sums[s]
      s += 1
    end
    r << sums[i]
  end
  sums[lbound, r.size] = r

  count
end
