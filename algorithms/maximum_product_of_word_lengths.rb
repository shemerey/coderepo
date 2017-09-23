# https://leetcode.com/problems/maximum-product-of-word-lengths/
#
# Given a string array words, find the maximum value of length(word[i]) *
# length(word[j]) where the two words do not share common letters. You may
# assume that each word will contain only lower case letters. If no such
# two words exist, return 0.
#
# Example 1:
#
#     Given ["abcw", "baz", "foo", "bar", "xtfn", "abcdef"]
#     Return 16
#     The two words can be "abcw", "xtfn".
#
# Example 2:
#
#     Given ["a", "ab", "abc", "d", "cd", "bcd", "abcd"]
#     Return 4
#     The two words can be "ab", "cd".
#
# Example 3:
#
#     Given ["a", "aa", "aaa", "aaaa"]
#     Return 0
#     No such pair of words.
#
# Credits:
#
#     Special thanks to @dietpepsi for adding this problem and creating all
#     test cases.


# @param {String[]} words
# @return {Integer}
def max_product(words)
  e = Range.new('a', 'z').to_enum.with_index
  m = e.with_object({}) { |(ch, idx), memo| memo[ch] = 2 ** idx }

  f = ->(w) { [w.chars.map(&->(ch){ m[ch] }).reduce(0, &:|), w.size] }
  a = words.map(&f).sort { |(_, s1), (_, s2)| s2 <=> s1 }

  product = 0
  a.each do |v1, s1|
    a.each do |v2, s2|
      break if product >= s1 * s2
      product = s1 * s2 if (v1 & v2).zero?
    end
  end
  product
end
