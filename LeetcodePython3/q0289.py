#!/usr/bin/python3
from typing import List

class Solution:
    def gameOfLife(self, board: List[List[int]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        m = len(board)
        n = len(board[0])
        def count(x, y):
            top = y - 1
            down = y + 1
            left = x - 1
            right = x + 1
            if top < 0:
                top = 0
            if down >= m:
                down = m - 1
            if left < 0:
                left = 0
            if right >= n:
                right = n - 1
            _count = 0
            for i in range(top, down + 1):
                for j in range(left, right + 1):
                    _count += board[i][j]
            _count -= board[y][x]
            return _count


        result = [[0 for _ in range(n)] for _ in range(m)]
        for i in range(m):
            for j in range(n):
                neighbours = count(j, i)
                if board[i][j] == 0 and neighbours == 3:
                    result[i][j] = 1
                if board[i][j] == 1 and (neighbours == 2 or neighbours == 3):
                    result[i][j] = 1
        for i in range(m):
            for j in range(n):
                board[i][j] = result[i][j]

board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
result = Solution().gameOfLife(board)
print(result)


