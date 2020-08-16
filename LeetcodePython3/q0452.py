#!/usr/bin/python3
from typing import List


class Solution:
    def findMinArrowShots(self, points: List[List[int]]) -> int:
        result = list()
        length = len(points)
        if length < 2:
            return length
        points.sort(key=lambda x: x[1])
        result.append(points[0])
        end = result[-1][1]
        for i in range(1, length):
            # print(points[i][0], end)
            if points[i][0] > end:
                result.append(points[i])
                end = result[-1][1]
        return len(result)

points = [[10,16],[2,8],[1,6],[7,12]]
print(Solution().findMinArrowShots(points))