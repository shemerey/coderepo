# https://leetcode.com/problems/palindrome-pairs/
#
# Given a list of unique words. Find all pairs of distinct indices (i, j) in
# the given list, so that the concatenation of the two words, i.e. words[i] +
# words[j] is a palindrome.
#
# Example 1:
#
#     Given words = ["bat", "tab", "cat"]
#     Return [[0, 1], [1, 0]]
#     The palindromes are ["battab", "tabbat"]
#
# Example 2:
#
#     Given words = ["abcd", "dcba", "lls", "s", "sssll"]
#     Return [[0, 1], [1, 0], [3, 2], [2, 4]]
#     The palindromes are ["dcbaabcd", "abcddcba", "slls", "llssssll"]
#
# Credits:
#
#     Special thanks to @dietpepsi for adding this problem and creating all
#     test cases.


# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
  enum = words.to_enum.with_index
   map = enum.each_with_object({}) { |(word, index), memo| memo[word] = index }

  enum.each_with_object([]) do |(word, index), memo|
    if word.empty?
      array = enum.select { |w, i| w == w.reverse && i != index }
      memo.concat(array.map(&->(w, i) { [index, i] }))
    end

    0.upto(word.size - 1) do |spt|
      prefix, suffix = word[0...spt], word[spt..-1]
      pindex, sindex = map[suffix.reverse], map[prefix.reverse]
      memo << [pindex, index] if pindex && prefix == prefix.reverse && pindex != index
      memo << [index, sindex] if sindex && suffix == suffix.reverse && sindex != index
    end
  end
end
