#!/usr/bin/python3
from typing import List

class Solution:
    def splitArray(self, nums: List[int], m: int) -> int:
        def vaild(sum_try):
            count = 1
            sum = 0
            for number in nums:
                sum += number
                if sum > sum_try:
                    sum = number
                    count += 1
            return count <= m

        sum = 0
        maxVal = nums[0]
        for number in nums:
            sum += number
            if maxVal < number:
                maxVal = number
        if m >= len(nums):
            return maxVal

        left = maxVal
        right = sum
        result = 0
        while left <= right:
            mid = (left + right) // 2
            if vaild(mid):
                result = mid
                right = mid - 1
            else:
                left = mid + 1
        return result


