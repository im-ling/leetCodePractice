#!/usr/bin/python3
import sys
from typing import List


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def arrayToListNode(array:List) -> ListNode:
    if len(array) < 1:
        return None
    head = ListNode(array[0])
    p = head
    for i in range(1, len(array)):
        node = ListNode(array[i])
        p.next = node
        p = p.next
    return head

def printListNode(node:ListNode):
    while node:
        print(node.val, end=", ")
        node = node.next
    print("\n")

class Solution:
    def insertionSortList(self, head: ListNode) -> ListNode:
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
                if(list[i].val < list[mid].val):
                    index = mid
                    right = mid - 1
                else:
                    left = mid + 1
            if i != index:
                node = list.pop(i)
                list.insert(index, node)
        for i in range (length - 1):
            list[i].next = list[i + 1]
        list[length - 1].next = None
        return list[0]


    def insertionSortList2(self, head: ListNode) -> ListNode:
        if not head:
            return head
        preHead = ListNode(-sys.maxsize)
        preHead.next = head
        p:ListNode = head.next
        while p:
            lastHead = preHead
            phead = preHead.next
            while (phead is not p) and phead.val <= p.val:
                phead = phead.next
                lastHead = lastHead.next
            if phead is p:
                p = p.next
            else:
                lastHead.next = p
                p = p.next
                lastHead.next.next = phead
                while phead.next != lastHead.next:
                    phead = phead.next
                phead.next = p
        return preHead.next


list = [3,2,1,4]
node = arrayToListNode(list)
solu = Solution()
result = solu.insertionSortList(node)
printListNode(result)

