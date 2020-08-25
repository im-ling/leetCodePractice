#!/usr/bin/python3
from typing import List


class Solution:
    flag = False

    def dfs(self, grid: List[List[str]], map: List[List[int]], lastRow: int, lastCol: int, maxRow: int, maxCol: int,
            color: int, row: int, col: int, char: str):
        if self.flag:
            return
        if row < 0 or col < 0 or row >= maxRow or col >= maxCol or (map[row][col] != 0 and map[row][col] < color) or grid[row][col] != char:
            return
        if map[row][col] == color:
            self.flag = True
            return
        map[row][col] = color
        next_moves = [[row + 1, col], [row - 1, col], [row, col + 1], [row, col - 1]]
        for pair in next_moves:
            if pair[0] == lastRow and pair[1] == lastCol:
                pass
            else:
                self.dfs(grid, map, row, col, maxRow, maxCol, color, pair[0], pair[1], char)

    def containsCycle(self, grid: List[List[str]]) -> bool:
        self.flag = False
        the_map = [[0 for _ in range(len(grid[0]))] for _ in range(len(grid))]
        maxRow = len(grid)
        maxCol = len(grid[0])
        color = 1
        for i in range(maxRow):
            for j in range(maxCol):
                if the_map[i][j] == 0:
                    self.dfs(grid, the_map, -1, -1, maxRow, maxCol, color, i, j, grid[i][j])
                    if self.flag:
                        return True
                    color += 1
        return False

grid = [["a","a","b"]]
result = Solution().containsCycle(grid)
print(result)