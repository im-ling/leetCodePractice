#!/usr/bin/python3
from typing import List

# https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/

class Solution:
    def findNumberIn2DArray(self, matrix: List[List[int]], target: int) -> bool:
        left = 0
        top = 0
        down = len(matrix) - 1
        if down < 0:
            return False
        right = len(matrix[0]) - 1
        if right < 0:
            return False

        while left <= right and top <= down:
            # print(top, left, down, right)
            while top <= down and matrix[top][right] < target:
                top += 1
            if top <= down and matrix[top][right] == target:
                return True
            right -= 1

            while top <= down and matrix[down][left] > target:
                down -= 1
            if top <= down and matrix[down][left] == target:
                return True
            left += 1

        return False


matrix = [[1, 4, 7, 11, 15], [2, 5, 8, 12, 19], [3, 6, 9, 16, 22], [10, 13, 14, 17, 24], [18, 21, 23, 26, 30]]
target = 5
print(Solution().findNumberIn2DArray(matrix, target))
