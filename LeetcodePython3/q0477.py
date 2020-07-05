#!/usr/bin/python3
from typing import List


class Solution:

    def totalHammingDistance(self, nums: List[int]) -> int:
        totalDistance = 0
        lenNums = len(nums)
        for i in range(32):
            numsOfOne = 0
            for num in nums:
                numsOfOne += (num >> i) & 0x1
            totalDistance += (lenNums - numsOfOne) * numsOfOne
        return totalDistance


solu = Solution()
nums = [4,14,4,14]
result = solu.totalHammingDistance(nums)
print(result)
