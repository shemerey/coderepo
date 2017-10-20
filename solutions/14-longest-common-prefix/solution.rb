# https://leetcode.com/problems/longest-common-prefix/description/
#
# Write a function to find the longest common prefix string amongst an array of strings.
#
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  acc = {}


  strs.each do |word|
    prefix = ''
    word.chars.each do |char|
      prefix += char
      acc[prefix] ||= 0
      acc[prefix] += 1
    end
  end

  result = ''
  acc.each do |item, mentioned|
    next if mentioned < strs.size
    result = item if result.size < item.size
  end

  result
end


if __FILE__ == $PROGRAM_NAME
  puts longest_common_prefix(%w{an anto a anton}) #=> 'a'
  puts longest_common_prefix(%w{antonina anto antonio anton}) #=> 'anto'
  puts longest_common_prefix(%w{an anto an anton}) #=> 'an'
  puts longest_common_prefix(%w{an anto an anton}) #=> 'an'
end
