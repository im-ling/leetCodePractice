#!/usr/bin/python3
from typing import List


class Solution:
    def getMaxLen(self, nums: List[int]) -> int:
        result = 0

        def countNums(_nums: List[int], low: int, high: int) -> int:
            if high < low:
                return 0
            countMinus = 0
            index = low
            while index <= high:
                if _nums[index] < 0:
                    countMinus += 1
                index += 1
            if countMinus & 0x1 == 0:
                return high - low + 1

            index = low
            maxVal = 0
            while index <= high:
                if _nums[index] < 0:
                    maxVal = max(high - index, index - low)
                index += 1
            index = high
            while index >= low:
                if _nums[index] < 0:
                    maxVal = max(maxVal, high - index, index - low)
                index -= 1
            return maxVal

        last = 0
        for i in range(len(nums)):
            if nums[i] == 0:
                result = max(result, countNums(nums, last, i - 1))
                last = i + 1
        result = max(result, countNums(nums, last, len(nums) - 1))
        return result
