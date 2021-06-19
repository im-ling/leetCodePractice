#!/usr/bin/python3
from typing import List

# https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/

class Solution:
    def findRepeatNumber(self, nums: List[int]) -> int:
        for index in range(len(nums)):
            if index == nums[index]:
                continue
            elif nums[index] == nums[nums[index]]:
                return nums[index]
            else:
                num = nums[index]
                nums[index] = nums[num]
                nums[num] = num
        return -1
