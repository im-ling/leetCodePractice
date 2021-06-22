#!/usr/bin/python3
from typing import List


class Solution:
    def summaryRanges(self, nums: List[int]) -> List[str]:
        length = len(nums)
        if length == 0:
            return []
        if length == 1:
            return [str(nums[0])]
        result = []
        start = 0
        end = 0
        for i in range(1, length):
            if nums[i] - nums[start] == i - start:
                end = i
            else:
                if end > start:
                    result.append(str(nums[start]) + "->" + str(nums[end]))
                else:
                    result.append(str(nums[start]))
                start = i
                end = i

        if end > start:
            result.append(str(nums[start]) + "->" + str(nums[end]))
        else:
            result.append(str(nums[start]))
        return result
