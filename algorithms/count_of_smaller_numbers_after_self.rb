# https://leetcode.com/problems/count-of-smaller-numbers-after-self/
#
# You are given an integer array nums and you have to return a new counts array.
# The counts array has the property where counts[i] is the number of smaller
# elements to the right of nums[i].
#
# Example:
#
#     Given nums = [5, 2, 6, 1]
#     To the right of 5 there are 2 smaller elements (2 and 1).
#     To the right of 2 there is only 1 smaller element (1).
#     To the right of 6 there is 1 smaller element (1).
#     To the right of 1 there is 0 smaller element.
#     Return the array [2, 1, 1, 0].


class BinarySearchTreeNode
  attr_accessor :value, :count, :lcount, :left, :right

  def initialize(value, count=1, lcount=0)
    @value, @count, @lcount = value, count, lcount
  end
end


class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BinarySearchTreeNode.new(value)
      return 0
    end

    node, order = @root, 0
    while true
      if node.value > value
        node.lcount += 1
        if node.left
          node = node.left; next
        else
          node.left = BinarySearchTreeNode.new(value)
          return order
        end
      end

      if node.value < value
        order += node.lcount + node.count
        if node.right
          node = node.right; next
        else
          node.right = BinarySearchTreeNode.new(value)
          return order
        end
      end

      node.count += 1
      return order + node.lcount
    end
  end
end


# @param {Integer[]} nums
# @return {Integer[]}
def count_smaller(nums)
  tree = BinarySearchTree.new
  nums.reverse.map(&->(n){ tree.insert(n) }).reverse
end
