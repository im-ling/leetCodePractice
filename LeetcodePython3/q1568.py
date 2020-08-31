#!/usr/bin/python3
from typing import List
from copy import deepcopy


class Solution:
    def fillGridWithNumber(self, grid: List[List[int]], x: int, y: int, maxX: int, maxY: int):
        if x < 0 or y < 0 or x >= maxX or y >= maxY or grid[x][y] == 0:
            return
        grid[x][y] = 0
        self.fillGridWithNumber(grid, x + 1, y, maxX, maxY)
        self.fillGridWithNumber(grid, x - 1, y, maxX, maxY)
        self.fillGridWithNumber(grid, x, y + 1, maxX, maxY)
        self.fillGridWithNumber(grid, x, y - 1, maxX, maxY)

    def checkGrid(self, grid: List[List[int]]) -> bool:
        tempGrid = deepcopy(grid)
        maxX = len(tempGrid)
        maxY = len(tempGrid[0])

        foundIsland = False
        for x in range(maxX):
            for y in range(maxY):
                if tempGrid[x][y] > 0:
                    self.fillGridWithNumber(tempGrid, x, y, maxX, maxY)
                    foundIsland = True
                    break
            if foundIsland:
                break

        for x in range(maxX):
            for y in range(maxY):
                if tempGrid[x][y] > 0:
                    return True
        return not foundIsland

    def tryMapRow(self, grid: List[List[int]], number: int, lastX:int) -> bool:
        if number == 0:
            return self.checkGrid(grid)
        maxX = len(grid)
        maxY = len(grid[0])
        for x in range(lastX, maxX):
            for y in range(maxY):
                if grid[x][y] > 0:
                    grid[x][y] = 0
                    if self.tryMapRow(grid, number - 1, x + 1):
                        return True
                    grid[x][y] = 1
        return False

    def tryMapCol(self, grid: List[List[int]], number: int, lastY:int) -> bool:
        if number == 0:
            return self.checkGrid(grid)
        maxX = len(grid)
        maxY = len(grid[0])
        for y in range(lastY, maxY):
            for x in range(maxX):
                if grid[x][y] > 0:
                    grid[x][y] = 0
                    if self.tryMapRow(grid, number - 1, maxY + 1):
                        return True
                    grid[x][y] = 1
        return False

    def checkSpecialTwo(self, grid:[List]) -> bool:
        maxX = len(grid)
        maxY = len(grid[0])
        count = 0
        indexX = 0
        indexY = 0
        for i in range(maxX):
            for j in range(maxY):
                if grid[i][j] > 0:
                    count += 1
                    if count > 2:
                        return False
                    indexX = i
                    indexY = j
        if count == 2:
            if indexX > 0 and grid[indexX - 1][indexY] > 0:
                return True
            if indexY > 0 and grid[indexX][indexY - 1] > 0:
                return True
        return False


    def minDays(self, grid: List[List[int]]) -> int:
        result = 0
        if self.checkSpecialTwo(grid):
            return 2
        while True:
            if self.tryMapRow(grid, result, 0):
                return result
            if result > 1 and self.tryMapCol(grid, result, 0):
                return result
            result += 1
        return -1

grid = [[1,1]]
result = Solution().minDays(grid)
print(result)