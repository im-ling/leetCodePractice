#!/usr/bin/python3
from typing import List

class Solution:
    def findRightInterval(self, intervals: List[List[int]]) -> List[int]:
        dic = {}
        for index, interval in enumerate(intervals):
            dic[interval[0]] = index
        sort_keys = sorted(dic.keys())
        length = len(intervals)
        result = list()
        local_append = result.append
        for x, y in intervals:
            left = 0
            right = length - 1
            target = -1
            while left <= right:
                mid = (left + right) // 2
                if sort_keys[mid] >= y:
                    target = dic[sort_keys[mid]]
                    right = mid - 1
                else:
                    left = mid + 1
            local_append(target)
        return result

intervals = [[1,2]]
reuslt = Solution().findRightInterval(intervals)
print(reuslt)
