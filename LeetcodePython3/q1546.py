#!/usr/bin/python3
from typing import List

class Solution:
    def maxNonOverlapping(self, nums: List[int], target: int) -> int:
        dic = {0:-1}
        start = -1
        presum = 0
        result = 0
        for i in range(len(nums)):
            num = nums[i]
            presum += num
            remain = presum - target
            if remain in dic and dic[remain] >= start:
                result += 1
                start = i
            dic[presum] = i
        return result

    def maxNonOverlapping2(self, nums: List[int], target: int) -> int:
        dic = {0:0}
        sum = 0
        result = 0
        for num in nums:
            sum += num
            remain = sum - target
            if remain in dic:
                result = max(result, dic[remain] + 1)
            dic[sum] = result
        return result

