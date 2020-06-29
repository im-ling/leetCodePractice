#!/usr/bin/python3
from typing import List


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def reorderList(self, head: ListNode) -> None:
        """
        Do not return anything, modify head in-place instead.
        """
        if head is None:
            return
        nodesList: List[ListNode] = list()
        p: ListNode = head
        while p is not None:
            nodesList.append(p)
            p = p.next

        lenOfList: int = len(nodesList)
        for i in range(lenOfList // 2):
            nodesList[i].next = nodesList[lenOfList - i - 1]
            nodesList[lenOfList - i - 1].next = nodesList[i + 1]
        nodesList[len(nodesList) // 2].next = None


node1 = ListNode(1)
node2 = ListNode(2)
node3 = ListNode(3)
node1.next = node2
node2.next = node3
solu = Solution()
solu.reorderList(node1)
p = node1
while p is not None:
    print(p.val)
    p = p.next