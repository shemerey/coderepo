# https://leetcode.com/problems/mini-parser/
#
# Given a nested list of integers represented as a string, implement a parser
# to deserialize it.
#
# Each element is either an integer, or a list -- whose elements may also be
# integers or other lists.
#
# Note: You may assume that the string is well-formed:
#
#     * String is non-empty.
#     * String does not contain white spaces.
#     * String contains only digits 0-9, [, - ,, ].
#
# Example 1:
#
#     Given s = "324",
#     You should return a NestedInteger object which contains a single integer
#     324.
#
# Example 2:
#
#     Given s = "[123,[456,[789]]]",
#     Return a NestedInteger object containing a nested list with 2 elements:
#         1. An integer containing value 123.
#         2. A nested list containing two elements:
#             i.  An integer containing value 456.
#             ii. A nested list with one element:
#                 a. An integer containing value 789.


# This is the interface that allows for creating nested lists. You should not
# implement it, or speculate about its implementation
#
# class NestedInteger
#   def is_integer()
#     """
#     Return true if this NestedInteger holds a single integer, rather than a nested list.
#     @return {Boolean}
#     """
#
#   def get_integer()
#     """
#     Return the single integer that this NestedInteger holds, if it holds a single integer
#     Return nil if this NestedInteger holds a nested list
#     @return {Integer}
#     """
#
#   def set_integer(value)
#     """
#     Set this NestedInteger to hold a single integer equal to value.
#     @return {Void}
#     """
#
#   def add(elem)
#     """
#     Set this NestedInteger to hold a nested list and adds a nested integer elem to it.
#     @return {Void}
#     """
#
#   def get_list()
#     """
#     Return the nested list that this NestedInteger holds, if it holds a nested list
#     Return nil if this NestedInteger holds a single integer
#     @return {NestedInteger[]}
#     """


# @param {String} s
# @return {NestedInteger}
def deserialize(s)
  _deserialize_(s, 0).first
end

private def _deserialize_(s, cursor)
  case s[cursor]
  when '-', /[0-9]/ then _deserialize_integer_(s, cursor)
  when '[' then _deserialize_list_(s, cursor)
  end
end

private def _deserialize_integer_(s, cursor)
  beginning, ending = cursor, s.size
  integer = NestedInteger.new

  cursor += 1
  cursor += 1 while cursor < ending && s[cursor] =~ /[0-9]/
  integer.set_integer(s[beginning...cursor].to_i)

  [integer, cursor]
end

private def _deserialize_list_(s, cursor)
  list = NestedInteger.new

  cursor += 1
  loop do
    break if s[cursor] == ']'
    cursor += 1 if s[cursor] == ','
    item, cursor = _deserialize_(s, cursor)
    list.add(item)
  end

  [list, cursor + 1]
end
