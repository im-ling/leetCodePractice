#!/usr/bin/python3
from typing import List


class Solution:
    minVal = 0
    flag = False

    def finMinHelper(self, nums: List[int], left: int, right: int):
        if left > right or self.flag:
            return
        if left == right:
            if nums[left] < self.minVal:
                self.minVal = nums[left]
            return
        mid = (left + right + 1) // 2
        if nums[mid] < self.minVal:
            self.minVal = nums[mid]
            if nums[mid] < nums[mid - 1]:
                self.flag = True

        if nums[mid] == nums[right] == nums[left]:
            self.finMinHelper(nums, left, mid - 1)
            self.finMinHelper(nums, mid + 1, right)
        elif nums[mid] >= nums[left] >= nums[right]:
            self.finMinHelper(nums, mid + 1, right)
        else:
            self.finMinHelper(nums, left, mid - 1)

    def findMin(self, nums: List[int]) -> int:
        left = 0
        right = len(nums) - 1
        if nums[left] < nums[right]:
            return nums[left]
        self.flag = False
        self.minVal = nums[0]
        self.finMinHelper(nums, left, right)
        return self.minVal


solu = Solution()
nums = [3,5,1]
result = solu.findMin(nums)
print(result)
