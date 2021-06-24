# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    def deleteNode(self, head: ListNode, val: int) -> ListNode:
        pre = ListNode(0)
        pre.next = head
        p = pre
        while p.next:
            if p.next.val == val:
                p.next = p.next.next
                return pre.next
            else:
                p = p.next
        return pre.next


node1 = ListNode(1)
node2 = ListNode(1)
node1.next = node2
result = Solution().deleteNode(node1, 1)
print(result)
