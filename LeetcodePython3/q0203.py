class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution:
    def removeElements(self, head: ListNode, val: int) -> ListNode:
        preHead = ListNode(0, head)
        p_pre = preHead
        p = head
        while p:
            while p.val != val:
                p = p.next
                p_pre = p_pre.next
            p_pre.next = p.next
            p = p.next
        return preHead.next