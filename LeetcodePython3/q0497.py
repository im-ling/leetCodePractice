#!/usr/bin/python3
from random import randint
from typing import List

class Solution:
    rects = list()
    probabilities = list()
    sum = 0

    def __init__(self, rects: List[List[int]]):
        self.rects = rects
        self.sum = 0
        self.probabilities = list()
        for rect in rects:
            area = (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
            self.sum += area
            self.probabilities.append(self.sum)

    def pick(self) -> List[int]:
        random_number = randint(0, self.sum)
        index = 0
        left = 0
        right = len(self.probabilities) - 1
        while left <= right:
            mid = (left + right) // 2
            if random_number <= self.probabilities[mid]:
                index = mid
                right = mid - 1
            else:
                left = mid + 1
        # print(index, len(self.probabilities))
        rect = self.rects[index]
        random_x = randint(0, rect[2] - rect[0]) + rect[0]
        random_y = randint(0, rect[3] - rect[1]) + rect[1]
        return [random_x, random_y]

# Your Solution object will be instantiated and called as such:
rects = [[35330199, -46858448, 35330694, -46856950]]
obj = Solution(rects)
for i in range(1000):
    print(obj.pick())
