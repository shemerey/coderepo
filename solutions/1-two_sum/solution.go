package main

import "fmt"

//  https://leetcode.com/problems/two-sum/
//
//  Given an array of integers, find two numbers such that they add up to a
//  specific target number. The function twoSum should return indices of the
//  two numbers such that they add up to the target, where index1 must be less
//  than index2. Please note that your returned answers (both index1 and
//  index2) are not zero-based. You may assume that each input would have
//  exactly one solution.
//
//  Input: numbers={2, 7, 11, 15}, target=9
//  Output: index1=1, index2=2
//  @param {Integer[]} nums
//  @param {Integer} target
//  @return {Integer[]}
func twoSum(nums []int, target int) []int {
	acc := map[int]int{}

	for i, el := range nums {
		if j, ok := acc[target-el]; ok {
			return []int{j, i}
		}

		acc[el] = i
	}

	return []int{0, 0}
}

func main() {
	fmt.Println(twoSum([]int{2, 3, 4, 6, 7}, 8)) // [0, 3]
}
