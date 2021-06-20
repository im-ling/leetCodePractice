#!/usr/bin/python3
from typing import List

# https://leetcode-cn.com/problems/YesdPw/
class Solution:
    def largestArea(self, grid: List[str]) -> int:
        y = len(grid)
        x = len(grid[0])
        matrix2 = [[True for _ in range(x)] for _ in range(y)]
        result = [0]
        sum = [0]

        def travel(i, j, char):
            if i < 0 or i >= y or j < 0 or j >= x or not matrix2[i][j] or grid[i][j] != char:
                return
            matrix2[i][j] = False
            sum[0] += 1
            if sum[0] > result[0]:
                result[0] = sum[0]
            travel(i - 1, j, char)
            travel(i + 1, j, char)
            travel(i, j - 1, char)
            travel(i, j + 1, char)

        for i in range(y):
            travel(i, 0, grid[i][0])
            travel(i, x - 1, grid[i][x - 1])
        for j in range(x):
            travel(0, j, grid[0][j])
            travel(y - 1, j, grid[y - 1][j])

        zeros = list()
        for i in range(y):
            for j in range(x):
                if grid[i][j] == "0":
                    matrix2[i][j] = False
                    zeros.append([i, j])

        for zero in zeros:
            i = zero[0]
            j = zero[1]
            if i > 0:
                sum[0] = 0
                travel(i - 1, j, grid[i - 1][j])
            if i < y - 1:
                sum[0] = 0
                travel(i + 1, j, grid[i + 1][j])
            if j > 0:
                sum[0] = 0
                travel(i, j - 1, grid[i][j - 1])
            if j < x - 1:
                sum[0] = 0
                travel(i, j + 1, grid[i][j + 1])

        # print(matrix2)
        # for i in range(y):
        #     for j in range(x):
        #         if matrix2[i][j]:
        #             print(1, end="")
        #         else:
        #             print(0, end="")
        #     print("")

        result[0] = 0
        for i in range(y):
            for j in range(x):
                if matrix2[i][j]:
                    sum[0] = 0
                    travel(i, j, grid[i][j])
        return result[0]


grid = ["15541253","22225311","13423353","51225334","32114344","44554553","00041254","24415305"]
result = Solution().largestArea(grid)
print(result)
