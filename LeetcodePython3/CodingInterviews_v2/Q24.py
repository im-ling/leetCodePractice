#!/usr/bin/python3
from typing import List

class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        preHead = ListNode(0)
        p = head
        while p:
            pre = preHead.next
            preHead.next = p
            p = p.next
            preHead.next.next = pre
        return preHead.next
