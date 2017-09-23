package main

import (
	"fmt"
	"reflect"
	"testing"
)

// TestTwoSum
func TestTwoSum(t *testing.T) {
	testCases := []struct {
		Input []int
		Sum   int
		Out   []int
	}{
		{
			Input: []int{2, 3, 4, 6, 7},
			Sum:   5,
			Out:   []int{0, 1},
		},
		{
			Input: []int{2, 3, 4, 6, 7},
			Sum:   8,
			Out:   []int{0, 3},
		},
		{
			Input: []int{2, 3, 4, 6, 7},
			Sum:   10,
			Out:   []int{2, 3},
		},
	}

	for _, tc := range testCases {
		if reflect.DeepEqual(twoSum(tc.Input, tc.Sum), tc.Out) {
			fmt.Println("👌")
		} else {
			t.Fatalf("not eql fo Input %v, Sum %v, => Out %v", tc.Input, tc.Sum, tc.Out)
		}
	}
}
