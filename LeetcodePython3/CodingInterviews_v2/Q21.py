#!/usr/bin/python3
from typing import List

class Solution:
    def exchange(self, nums: List[int]) -> List[int]:
        left = 0
        right = len(nums) - 1
        while left < right:
            while left < right and nums[left] & 0x1 > 0:
                left += 1
            while left < right and nums[right] & 1 == 0:
                right -= 1
            if left < right:
                tmp = nums[left]
                nums[left] = nums[right]
                nums[right] = tmp
                left += 1
                right -= 1
        return nums
nums = [1,2,3,4]
result = Solution().exchange(nums)
print(result)