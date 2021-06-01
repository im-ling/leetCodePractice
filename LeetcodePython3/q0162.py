#!/usr/bin/python3
from typing import List


class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        right = len(nums) - 1
        if right == 0 or nums[0] > nums[1]:
            return 0
        if nums[right] > nums[right - 1]:
            return right

        left = 1
        right -= 1

        while left <= right:
            mid = (left + right) >> 1
            if nums[mid] > nums[mid - 1]:
                if nums[mid] > nums[mid + 1]:
                    return mid
                left = mid + 1
            else:
                right = mid - 1
        return -1


nums = [1, 2, 1, 2, 1]
result = Solution().findPeakElement(nums)
print(result)
