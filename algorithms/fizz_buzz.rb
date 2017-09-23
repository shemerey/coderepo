# https://leetcode.com/problems/fizz-buzz/
#
# Write a program that outputs the string representation of numbers from 1 to
# n. But for multiples of three it should output "Fizz" instead of the number
# and for the multiples of five output "Buzz". For numbers which are multiples
# of both three and five output "FizzBuzz".
#
# Examples:
#
#     n = 15,
#
#     Return:
#     [
#         "1",
#         "2",
#         "Fizz",
#         "4",
#         "Buzz",
#         "Fizz",
#         "7",
#         "8",
#         "Fizz",
#         "Buzz",
#         "11",
#         "Fizz",
#         "13",
#         "14",
#         "FizzBuzz"
#     ]


# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  1.upto(n).map do |num|
    next "FizzBuzz" if num % 15 == 0
    next "Fizz" if num % 3 == 0
    next "Buzz" if num % 5 == 0
    next num.to_s
  end
end
