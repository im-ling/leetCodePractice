"""
# Definition for a Node.
"""


class Node:
    def __init__(self, val, prev, next, child):
        self.val = val
        self.prev = prev
        self.next = next
        self.child = child


class Solution:
    def flatten(self, head: 'Node') -> 'Node':
        p = head
        while p:
            if p.child:
                tmp: Node = p.next
                childHead = self.flatten(p.child)
                p.child = None
                p.next = childHead
                childHead.prev = p
                p = childHead
                while p.next:
                    p = p.next
                p.next = tmp
                tmp.prev = p
                p = tmp
            else:
                p = p.next
        return head
