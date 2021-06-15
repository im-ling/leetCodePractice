#!/usr/bin/python3
from typing import List
from heapq import heappush, heappushpop
class MedianFinder:

    count = 0
    left = []
    right = []

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.count = 0
        self.left = []
        self.right = []

    def addNum(self, num: int) -> None:
        if self.count % 2 == 0:
            heappush(self.right, -heappushpop(self.left, -num))
        else:
            heappush(self.left, -heappushpop(self.right, num))
        self.count += 1

    def findMedian(self) -> float:
        if self.count % 2 == 1:
            return self.right[0]
        else:
            return (-self.left[0] + self.right[0]) / 2.0

heap1 = []
heappush(heap1,2)
heappush(heap1,1)
heappush(heap1,3)
print(heap1[0])
print(heap1)


