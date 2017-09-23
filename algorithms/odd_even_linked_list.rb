# https://leetcode.com/problems/odd-even-linked-list/
#
# Given a singly linked list, group all odd nodes together followed by the even
# nodes. Please note here we are talking about the node number and not the
# value in the nodes.
#
# You should try to do it in place. The program should run in O(1) space
# complexity and O(nodes) time complexity.
#
# Example:
#
#      Given 1 -> 2 -> 3 -> 4 -> 5 -> NULL,
#     return 1 -> 3 -> 5 -> 2 -> 4 -> NULL.
#
# Note:
#
#     + The relative order inside both the even and odd groups should remain
#       as it was in the input.
#     + The first node is considered odd, the second node even and so on ...
#
# Credits:
#
#     Special thanks to @aadarshjajodia for adding this problem and creating
#     all test cases.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @return {ListNode}
def odd_even_list(head)
  return nil if head.nil?

  h1 = t1 = ListNode.new(nil)
  h2 = t2 = ListNode.new(nil)

  size = 0
  while head
    curr = head
    head = head.next
    size = size + 1

    if size.odd?
      t1.next = curr
      t1 = t1.next
    else
      t2.next = curr
      t2 = t2.next
    end
  end

  t2.next = nil
  t1.next = h2.next
  h1.next
end
