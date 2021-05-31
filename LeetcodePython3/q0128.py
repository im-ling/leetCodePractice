#!/usr/bin/python3
from typing import List


class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        dic = {}
        result = 0
        for num in nums:
            if num in dic:
                continue
            left = 0
            right = 0
            if (num - 1) in dic:
                left = dic[num - 1]
            if (num + 1) in dic:
                right = dic[num + 1]
            length = left + right + 1
            dic[num + right] = dic[num - left] = dic[num] = length
            if length > result:
                result = length
        return result

nums = [0,3,7,2,5,8,4,6,0,1]
result = Solution().longestConsecutive(nums)
print(result)
