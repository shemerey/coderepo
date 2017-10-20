package main

import (
	"fmt"
	"reflect"
	"testing"
)

// TestTwoSum
func TestLongestCommonPrefix(ot *testing.T) {
	testCases := []struct {
		Input []string
		Out   string
	}{
		{
			Input: []string{"an", "anton", "antnion", "ant"},
			Out:   "an",
		},
	}

	for _, tc := range testCases {
		if reflect.DeepEqual(LongestCommonPrefix(tc.Input), tc.Out) {
			fmt.Println("👌")
		} else {
			ot.Fatalf("not eql fo Input %v => Out %v", tc.Input, tc.Out)
		}
	}
}
