#!/usr/bin/python3
from copy import deepcopy
from typing import List

class Solution:
    def rotting(self, grid: List[List[int]], x:int, y:int, x_len:int, y_len: int):
        if x < 0 or y < 0 or x >= x_len or y >= y_len or grid[x][y] != 1:
            return
        grid[x][y] = 2


    def orangesRotting(self, grid: List[List[int]]) -> int:
        x_len = len(grid)
        y_len = len(grid[0])
        left = 0
        for i in range(x_len):
            for j in range(y_len):
                if grid[i][j] == 1:
                    left += 1

        lastLeft = left
        count = 0
        while left > 0:
            count += 1
            grid1 = deepcopy(grid)
            for i in range(x_len):
                for j in range(y_len):
                    if grid1[i][j] == 2:
                        self.rotting(grid, i - 1, j, x_len, y_len)
                        self.rotting(grid, i + 1, j, x_len, y_len)
                        self.rotting(grid, i, j - 1, x_len, y_len)
                        self.rotting(grid, i, j + 1, x_len, y_len)
            left = 0
            for i in range(x_len):
                for j in range(y_len):
                    if grid[i][j] == 1:
                        left += 1
            if left == lastLeft:
                return -1
            lastLeft = left
        return count

grid = [[2,1,1],[1,1,0],[0,1,1]]
result = Solution().orangesRotting(grid)
print(result)