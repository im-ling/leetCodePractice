#!/usr/bin/python3
from typing import List


class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        length = len(nums)
        sum = (1 + length) * length // 2
        for num in nums:
            sum -= num
        return sum
