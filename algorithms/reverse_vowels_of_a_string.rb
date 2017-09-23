# https://leetcode.com/problems/reverse-vowels-of-a-string/
#
# Write a function that takes a string as input and reverse only the vowels of
# a string.
#
# Example 1:
#
#     Given s = "hello", return "holle".
#
# Example 2:
#
#     Given s = "leetcode", return "leotcede".


# @param {String} s
# @return {String}
def reverse_vowels(s)
  i1, i2 = 0, s.size - 1

  while true
    cmp1 =
      while true
        break if i1 > i2
        c1 = s[i1]; i1 += 1
        break true if 'aeiou'.include?(c1.downcase)
      end

    cmp2 =
      while true
        break if i1 > i2
        c2 = s[i2]; i2 -= 1
        break true if 'aeiou'.include?(c2.downcase)
      end

    return s unless cmp1 && cmp2
    s[i1 - 1], s[i2 + 1] = s[i2 + 1], s[i1 - 1]
  end
end
