#!/usr/bin/python3
from typing import List

class Solution:
    def findMaxLength(self, nums: List[int]) -> int:
        map = {0: -1}
        result = 0
        count = 0
        for i in range(len(nums)):
            if nums[i] == 0:
                count += 1
            else:
                count -= 1
            if count in map and i - map[count] > result:
                result = i - map[count]
            if count not in map:
                map[count] = i

        return result