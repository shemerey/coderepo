# https://leetcode.com/problems/two-sum/
#
# Given an array of integers, find two numbers such that they add up to a
# specific target number. The function twoSum should return indices of the
# two numbers such that they add up to the target, where index1 must be less
# than index2. Please note that your returned answers (both index1 and
# index2) are not zero-based. You may assume that each input would have
# exactly one solution.
#
# Input: numbers={2, 7, 11, 15}, target=9
# Output: index1=1, index2=2
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  map = {}

  nums.each_with_index do |num, idx|
    i = map[target - num]
    return [i, idx] if i

    map[num] = idx
  end
end

if __FILE__ == $PROGRAM_NAME
  puts two_sum([2,3,4,5,6], 5).to_s #=> [0,1]
  puts two_sum([2,3,4,5,6], 6).to_s #=> [0,2]
  puts two_sum([2,3,4,5,6], 9).to_s #=> [2,3]
end