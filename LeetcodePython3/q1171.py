#!/usr/bin/python3
from typing import List

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def removeZeroSumSublists(self, head: ListNode) -> ListNode:
        listArray:List[ListNode] = list()
        listArray.append(ListNode(0))
        while head:
            listArray.append(head)
            head = head.next
        indexDic = {}
        sum = 0
        index = 0
        while index < len(listArray):
            sum += listArray[index].val
            if sum in indexDic:
                left = indexDic[sum] + 1
                sum -= listArray[index].val
                listArray.pop(index)
                for j in reversed(range(left, index)):
                    del indexDic[sum]
                    sum -= listArray[j].val
                    listArray.pop(j)
                index = indexDic[sum]
            else:
                indexDic[sum] = index
            index += 1

        listArray.pop(0)
        for i in range(len(listArray) - 1):
            listArray[i].next = listArray[i + 1]
        listArray[len(listArray) - 1].next = None
        if len(listArray) > 0:
            return listArray[0]
        return None


nums = [1,2,3,-3,-2]
head = ListNode(nums[0])
p = head
for i in range(1, len(nums)):
    node = ListNode(nums[i])
    p.next = node
    p = p.next

solu = Solution()
p = solu.removeZeroSumSublists(head)
print("last")
while p:
    print(p.val)
    p = p.next