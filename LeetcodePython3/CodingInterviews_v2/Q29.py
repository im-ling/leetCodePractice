from typing import List


class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        max_i = len(matrix) - 1
        result = []
        if max_i < 0:
            return result
        max_j = len(matrix[0]) - 1
        if max_j < 0:
            return result

        top = 0
        down = max_i
        left = 0
        right = max_j

        while top <= down and left <= right:
            for i in range(left, right + 1):
                result.append(matrix[top][i])
            top += 1
            for i in range(top, down + 1):
                result.append(matrix[i][right])
            right -= 1
            if left > right or top > down:
                break
            for i in reversed(range(left, right + 1)):
                result.append(matrix[down][i])
            down -= 1
            for i in reversed(range(top, down + 1)):
                result.append(matrix[i][left])
            left += 1
        return result
