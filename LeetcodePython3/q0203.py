class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def removeElements(self, head: ListNode, val: int) -> ListNode:
        preHead = ListNode(0, head)
        p = preHead
        while p.next:
            if p.next.val == val:
                p.next = p.next.next
            p = p.next
        return preHead.next
