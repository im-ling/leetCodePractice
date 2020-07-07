#!/usr/bin/python3
from typing import List

class Solution:
    def islandPerimeter(self, grid: List[List[int]]) -> int:
        result = 0
        M = len(grid)
        N = len(grid[0])
        # 四周
        for i in range(N):
            if grid[0][i] == 1:
                result += 1
            if grid[M - 1][i] == 1:
                result += 1
        for i in range(M):
            if grid[i][0] == 1:
                result += 1
            if grid[i][N - 1] == 1:
                result += 1
        # 竖
        for i in range(M):
            for j in range(1, N):
                if grid[i][j] != grid[i][j - 1]:
                    result += 1
        # 横
        for i in range(N):
            for j in range(1, M):
                if grid[j][i] != grid[j - 1][i]:
                    result += 1
        return result

solu = Solution()
grid = [[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]
result = solu.islandPerimeter(grid)
print(result)