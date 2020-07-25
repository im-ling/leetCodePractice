#!/usr/bin/python3
from typing import List


class Solution:
    def findMin(self, nums: List[int]) -> int:
        left = 0
        right = len(nums) - 1
        if nums[left] <= nums[right]:
            return nums[left]
        while left <= right:
            mid = (left + right + 1) // 2
            if nums[mid] < nums[mid - 1]:
                return nums[mid]
            if nums[left] < nums[mid] and nums[left] > nums[right]:
                left = mid + 1
            else:
                right = mid - 1
        return nums[0]

solu = Solution()
nums = [4,5,6,7,0,1,2]
result = solu.findMin(nums)
print(result)