"""
# Definition for a Node.
"""


class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random


class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        if not head:
            return None
        map = {}
        p = head
        while p:
            new_node = Node(p.val)
            map[p] = new_node
            p = p.next
        p = head
        while p:
            if p.next:
                map[p].next = map[p.next]
            if p.random:
                map[p].random = map[p.random]
            p = p.next
        return map[head]
