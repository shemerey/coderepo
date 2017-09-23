# https://leetcode.com/problems/expression-add-operators/
#
# Given a string that contains only digits 0-9 and a target value, return all
# possibilities to add binary operators (not unary) +, -, or * between the
# digits so they evaluate to the target value.
#
# Examples:
#
#     "123", 6 -> ["1+2+3", "1*2*3"]
#     "232", 8 -> ["2*3+2", "2+3*2"]
#     "105", 5 -> ["1*0+5","10-5"]
#     "00" , 0 -> ["0+0", "0-0", "0*0"]
#     "3456237490", 9191 -> []
#
# Credits:
#
#     Special thanks to @davidtan1890 for adding this problem and creating
#     all test cases.


# @param {String} num
# @param {Integer} target
# @return {String[]}
def add_operators(num, target)
  return [] if num.empty?

  result = []
  1.upto(num.size) do |spt|
    break if spt - 0 > 1 && num[0] == '0'

    n = num[0...spt].to_i
    _add_operators_(num, spt, target, n, "#{n}", '#', n, result)
  end
  result
end

private def _add_operators_(num, idx, target, value, expr, op, multiplier, result)
  if idx == num.size
    result << expr if value == target
    return
  end

  Range.new(idx + 1, num.size).each do |spt|
    break if spt - idx > 1 && num[idx] == '0'

    n = num[idx...spt].to_i
    _add_operators_(num, spt, target, value + n, "#{expr}+#{n}", '+', n, result)
    _add_operators_(num, spt, target, value - n, "#{expr}-#{n}", '-', n, result)

    v = value * n
    v = value - multiplier + multiplier * n if op == '+'
    v = value + multiplier - multiplier * n if op == '-'
    _add_operators_(num, spt, target, v, "#{expr}*#{n}", op, multiplier * n, result)
  end
end
