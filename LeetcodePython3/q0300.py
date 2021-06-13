#!/usr/bin/python3
from typing import List

class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        length = len(nums)
        dp = [1 for _ in range(length)]
        result = 0
        for i in range(1, length):
            for j in reversed(range(0, i)):
                if nums[i] > nums[j]:
                    dp[i] = max(dp[i], dp[j] + 1)
                    if dp[i] > result:
                        result = dp[i]
        return result