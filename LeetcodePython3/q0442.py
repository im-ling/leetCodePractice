#!/usr/bin/python3
from typing import List


class Solution:
    def findDuplicates(self, nums: List[int]) -> List[int]:
        result = list()
        for i in range(len(nums)):
            index = abs(nums[i]) - 1
            if nums[index] < 0:
                result.append(index + 1)
            nums[index] = -nums[index]
        return result


    def findDuplicates2(self, nums: List[int]) -> List[int]:
        result = list()
        i = 0
        while i < len(nums):
            number = nums[i]
            if number == i + 1:
                i = i
            elif nums[number - 1] == number:
                result.append(number)
            elif number > i + 1:
                nums[i] = nums[number - 1]
                nums[number - 1] = number
                i -= 1
            else:
                nums[i] = nums[number - 1]
                nums[number - 1] = number
            i += 1
        return result