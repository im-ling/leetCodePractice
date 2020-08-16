#!/usr/bin/python3
from typing import List

class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        length = len(intervals)
        if length < 2:
            return intervals
        result = list()
        intervals.sort(key=lambda x: x[0])
        result.append(intervals[0])
        for i in range(1, length):
            end = result[-1][1]
            if intervals[i][0] > end:
                result.append(intervals[i])
            elif intervals[i][1] > result[-1][1]:
                result[-1][1] = intervals[i][1]
        return result
