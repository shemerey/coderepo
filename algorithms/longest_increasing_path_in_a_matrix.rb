# https://leetcode.com/problems/longest-increasing-path-in-a-matrix/
#
# Given an integer matrix, find the length of the longest increasing path. From
# each cell, you can either move to four directions: left, right, up or down.
# You may NOT move diagonally or move outside of the boundary (i.e. wrap-around
# is not allowed).
#
# Example 1:
#
#     nums = [
#       [9, 9, 4],
#       [6, 6, 8],
#       [2, 1, 1]
#     ]
#     Return 4. The longest increasing path is [1, 2, 6, 9].
#
# Example 2:
#
#     nums = [
#       [3, 4, 5],
#       [3, 2, 6],
#       [2, 2, 1]
#     ]
#     Return 4. The longest increasing path is [3, 4, 5, 6]. Moving diagonally
#     is not allowed.
#
# Credits:
#
#     Special thanks to @dietpepsi for adding this problem and creating all test
#     cases.


# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  return 0 if matrix.empty?

       m, n = matrix.size, matrix[0].size
  indegrees = Array.new(m * n, 0)
      edges = Hash.new { |hash, key| hash[key] = [] }

  0.upto(m * n - 1).each do |to|
    i, j = to.divmod(n)
    to_value = matrix[i][j]

    [
      (to - 1 if j > 0),
      (to + 1 if j < n - 1),
      (to - n if i > 0),
      (to + n if i < m - 1),
    ].compact.each do |from|
      i, j = from.divmod(n)
      from_value = matrix[i][j]

      if from_value < to_value
        indegrees[to] += 1
        edges[from] << to
      end
    end
  end

  nodes = []
  indegrees.each_with_index do |indegree, node|
    nodes << node if indegree.zero?
  end

  lens = Array.new(m * n, 1)
  until nodes.empty?
    newnodes = []
    nodes.each do |from|
      edges[from].each do |to|
        lens[to] = [lens[to], lens[from] + 1].max
        indegrees[to] -= 1
        newnodes << to if indegrees[to].zero?
      end
    end
    nodes = newnodes
  end

  lens.max
end
