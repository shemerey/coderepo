# https://leetcode.com/problems/minimum-height-trees/
#
# For a undirected graph with tree characteristics, we can choose any node as
# the root. The result graph is then a rooted tree. Among all possible rooted
# trees, those with minimum height are called minimum height trees (MHTs).
# Given such a graph, write a function to find all the MHTs and return a list
# of their root labels.
#
# Format:
#
#     The graph contains n nodes which are labeled from 0 to n - 1. You will
#     be given the number n and a list of undirected edges (each edge is a
#     pair of labels). You can assume that no duplicate edges will appear in
#     edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and
#     thus will not appear together in edges.
#
# Example 1:
#
#     Given n = 4, edges = [[1, 0], [1, 2], [1, 3]]
#
#           0
#           |
#           1
#          / \
#         2   3
#
#     return [1]
#
# Example 2:
#
#     Given n = 6, edges = [[0, 3], [1, 3], [2, 3], [4, 3], [5, 4]]
#
#         0  1  2
#          \ | /
#            3
#            |
#            4
#            |
#            5
#
#     return [3, 4]
#
# Hint:
#
#     How many MHTs can a graph have at most?
#
# Note:
#
#     + According to the definition of tree on Wikipedia: "a tree is an
#       undirected graph in which any two vertices are connected by exactly
#       one path. In other words, any connected graph without simple cycles is
#       a tree."
#     + The height of a rooted tree is the number of edges on the longest
#       downward path between the root and a leaf.
#
# Credits:
#
#     Special thanks to @peisi for adding this problem and creating all test
#     cases.


# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
  return [0] if n == 1

  m = (0...n).each_with_object({}) { |label, memo| memo[label] = [] }
  edges.each { |from, to| m[from] << to; m[to] << from }

  q = m.each_with_object([]) { |(k, v), memo| memo << k if v.size == 1 }
  while m.size > 2
    newq = []
    q.each do |to|
      from = m.delete(to)[0]
      m[from].delete(to)
      newq << from if m[from].size == 1
    end
    q = newq
  end

  q
end
