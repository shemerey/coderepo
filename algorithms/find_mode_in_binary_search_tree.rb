# https://leetcode.com/problems/find-mode-in-binary-search-tree/
#
# Given a binary search tree (BST) with duplicates, find all the mode(s) (the
# most frequently occurred element) in the given BST. Assume a BST is defined
# as follows:
#
#     + The left subtree of a node contains only nodes with keys less than or
#       equal to the node's key.
#     + The right subtree of a node contains only nodes with keys greater than
#       or equal to the node's key.
#     + Both the left and right subtrees must also be binary search trees.
#
# For example:
#
#     Given BST [1,null,2,2],
#
#       1
#        \
#         2
#        /
#       2
#
#     return [2].
#
# Note: If a tree has more than one mode, you can return them in any order.
#
# Follow up: Could you do that without using any extra space? (Assume that the
# implicit stack space incurred due to recursion does not count).


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Integer[]}
def find_mode(root)
  map = Hash.new { |h, k| h[k] = 0 }
  _inorder_traversal_(root) { |v| map[v] += 1 }

  max = map.values.max
  map.select(&->(_, v) { v == max }).keys
end

private def _inorder_traversal_(root)
  return if root.nil?

  _inorder_traversal_( root.left, &Proc.new)
  yield root.val
  _inorder_traversal_(root.right, &Proc.new)
end
