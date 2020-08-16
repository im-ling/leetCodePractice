#!/usr/bin/python3
from typing import List


class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        length = len(intervals)
        if length < 2:
            return 0
        intervals.sort(key=lambda x: x[1])
        result = 1
        end = intervals[0][1]
        for i in range(1,length):
            if intervals[i][0] >= end:
                result += 1
                end = intervals[i][1]
        return length - result

    def eraseOverlapIntervals2(self, intervals: List[List[int]]) -> int:
        length = len(intervals)
        intervals.sort(key=lambda x: x[1])
        result = 0
        while len(intervals) > 0:
            end = intervals[0][1]
            result += 1
            intervals.pop(0)
            index = len(intervals) - 1
            while index >= 0:
                if intervals[index][0] < end <= intervals[index][1]:
                    intervals.pop(index)
                index -= 1
        return length - result