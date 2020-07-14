#!/usr/bin/python3
from typing import List

class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        result = 0
        length = len(nums)
        for i in range(length):
            for j in range(i + 1, length):
                if nums[i] == nums[j]:
                    result += 1
        return result
