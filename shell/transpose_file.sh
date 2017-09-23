# https://leetcode.com/problems/transpose-file/
#
# Given a text file file.txt, transpose its content. You may assume that each
# row has the same number of columns and each field is separated by the ' '
# character.
#
# For example, if file.txt has the following content:
#
#     name age
#     alice 21
#     ryan 30
#
# Output the following:
#
#     name alice ryan
#     age 21 30


# Read from the file file.txt and print its transposed content to stdout.
awk '
NR == 1 { for (i = 1; i <= NF; i++) { line[i] = $i } }
NR  > 1 { for (i = 1; i <= NF; i++) { line[i] = line[i] " " $i } }
    END { for (i = 1; i <= NF; i++) { print line[i] } }
' file.txt
