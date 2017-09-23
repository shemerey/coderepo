# https://leetcode.com/problems/keyboard-row/
#
# Given a List of words, return the words that can be typed using letters of
# alphabet on only one row's of American keyboard like the image below.
#
#     1 2 3 4 5 6 7 8 9 0
#      Q W E R T Y U I O P
#       A S D F G H J K L
#        Z X C V B N M
#
# Example 1:
#
#     Input: ["Hello", "Alaska", "Dad", "Peace"]
#     Output: ["Alaska", "Dad"]
#
# Note:
#
#     + You may use one character in the keyboard more than once.
#     + You may assume the input string will only contain letters of alphabete


# @param {String[]} words
# @return {String[]}
def find_words(words)
  words.select do |word|
    word =~ /\A[qwertyuiop]+\z/i ||
    word =~ /\A[asdfghjkl]+\z/i ||
    word =~ /\A[zxcvbnm]+\z/i
  end
end
