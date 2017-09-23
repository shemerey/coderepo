# https://leetcode.com/problems/sum-of-left-leaves/
#
# Find the sum of all left leaves in a given binary tree.
#
# Example:
#
#           3
#          / \
#         9  20
#           /  \
#          15   7
#
#     There are two left leaves in the binary tree, with values 9 and 15
#     respectively. Return 24.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Integer}
def sum_of_left_leaves(root)
  return 0 if root.nil?
  return sum_of_left_leaves(root.right) if root.left.nil?
  return sum_of_left_leaves(root.right) + sum_of_left_leaves(root.left) if root.left.left || root.left.right
  return sum_of_left_leaves(root.right) + root.left.val
end
