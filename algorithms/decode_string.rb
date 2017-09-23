# https://leetcode.com/problems/decode-string/
#
# Given an encoded string, return it's decoded string. The encoding rule is:
# k[encoded_string], where the encoded_string inside the square brackets is
# being repeated exactly k times. Note that k is guaranteed to be a positive
# integer.
#
# You may assume that the input string is always valid; No extra white spaces,
# square brackets are well-formed, etc.
#
# Furthermore, you may assume that the original data does not contain any digits
# and that digits are only for those repeat numbers, k. For example, there won't
# be input like 3a or 2[4].
#
# Examples:
#
#     s = "3[a]2[bc]", return "aaabcbc".
#     s = "3[a2[c]]", return "accaccacc".
#     s = "2[abc]3[cd]ef", return "abcabccdcdcdef".


# @param {String} s
# @return {String}
def decode_string(s)
  _decode_string_(s, 0).first
end

private def _decode_string_(s, cursor)
  _beginning, ending = cursor, s.size
  string = ''

  while cursor < ending && s[cursor] != ']'
    substr, cursor = _decode_sub_string_(s, cursor)
    string << substr
  end

  [string, cursor]
end

private def _decode_sub_string_(s, cursor)
  if s[cursor] =~ /[0-9]/
    number, cursor = _get_number_(s, cursor)
    cursor += 1
    string, cursor = _decode_string_(s, cursor)
    cursor += 1
    return [string * number, cursor]
  end

  beginning, _ending = cursor, s.size
  cursor += 1 while s[cursor] =~ /[a-zA-Z]/
  return [s[beginning...cursor], cursor]
end

private def _get_number_(s, cursor)
  beginning, _ending = cursor, s.size
  cursor += 1 while s[cursor] =~ /[0-9]/
  return [s[beginning...cursor].to_i, cursor]
end
