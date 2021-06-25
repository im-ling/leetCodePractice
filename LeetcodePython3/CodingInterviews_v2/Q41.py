import heapq
from typing import List


class MedianFinder:
    left = []
    right = []
    isOdd = False

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.left = []
        self.right = []
        self.isOdd = False

    def addNum(self, num: int) -> None:
        if self.isOdd:
            heapq.heappush(self.right, num)
            heapq.heappush(self.left, -heapq.heappop(self.right))
        else:
            heapq.heappush(self.left, -num)
            heapq.heappush(self.right, -heapq.heappop(self.left))
        self.isOdd = not self.isOdd

    def findMedian(self) -> float:
        if self.isOdd:
            return self.right[0]
        else:
            return (self.right[0] - self.left[0]) / 2

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder()
# obj.addNum(num)
# param_2 = obj.findMedian()
