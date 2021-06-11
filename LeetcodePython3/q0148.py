#!/usr/bin/python3
from typing import List


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def sortList(self, head: ListNode) -> ListNode:
        if not head:
            return head
        p = head
        list: List[ListNode] = []
        while p:
            list.append(p)
            p = p.next
        length = len(list)
        for i in range(1, length):
            left = 0
            right = i - 1
            index = i
            while left <= right:
                mid = (left + right) // 2
                if (list[i].val < list[mid].val):
                    index = mid
                    right = mid - 1
                else:
                    left = mid + 1
            if i != index:
                node = list.pop(i)
                list.insert(index, node)
        for i in range(length - 1):
            list[i].next = list[i + 1]
        list[length - 1].next = None
        return list[0]
