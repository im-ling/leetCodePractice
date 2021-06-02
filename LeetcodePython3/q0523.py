#!/usr/bin/python3
from typing import List


class Solution:
    def checkSubarraySum(self, nums: List[int], k: int) -> bool:
        map = {}
        sum = 0
        map = {0:-1}
        for i in range(len(nums)):
            sum += nums[i]
            sum %= k
            if sum not in map:
                map[sum] = i
            else:
                if i - map[sum] > 1:
                    return True
        return False

nums = [23,2,4,6,6]
k = 7
result = Solution().checkSubarraySum(nums, k)
print(result)
