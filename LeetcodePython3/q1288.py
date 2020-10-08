#!/usr/bin/python3
from typing import List

class Solution:
    def removeCoveredIntervals(self, intervals: List[List[int]]) -> int:
        intervals.sort(key=lambda x: x[0])
        count = 0
        while count < len(intervals) - 1:
            if intervals[count][1] >= intervals[count + 1][1]:
                intervals.pop(count + 1)
                count -= 1
            elif intervals[count][0] == intervals[count + 1][0] and intervals[count + 1][1] > intervals[count][1]:
                intervals.pop(count)
                count -= 1
            count += 1
        return len(intervals)
