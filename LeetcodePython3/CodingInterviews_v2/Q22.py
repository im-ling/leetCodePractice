#!/usr/bin/python3
from typing import List

class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def getKthFromEnd(self, head: ListNode, k: int) -> ListNode:
        pfast = head
        pslow = None
        for i in range(k):
            if pfast:
                pfast = pfast.next
            else:
                return
        if pfast:
            pslow = head
            while pfast:
                pfast = pfast.next
                pslow = pslow.next
        return pslow
