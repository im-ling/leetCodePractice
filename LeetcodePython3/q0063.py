#!/usr/bin/python3
from typing import List

class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        len_row = len(obstacleGrid)
        len_col = len(obstacleGrid[0])
        dp = [[0 for _ in range(len_col)] for _ in range(len_row)]
        for i in range(len_row):
            for j in range(len_col):
                if obstacleGrid[i][j] == 1:
                    dp[i][j] = 0
                else:
                    if i == 0 and j == 0:
                        dp[i][j] = 1
                    elif i == 0:
                        dp[i][j] = dp[i][j - 1]
                    elif j == 0:
                        dp[i][j] = dp[i - 1][j]
                    else:
                        dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
        return dp[len_row - 1][len_col - 1]

grid = [[0,0,0],[0,1,0],[0,0,0]]
result = Solution().uniquePathsWithObstacles(grid)
print(result)