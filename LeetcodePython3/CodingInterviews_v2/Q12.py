#!/usr/bin/python3
from typing import List


class Solution:
    found = False

    def exist(self, board: List[List[str]], word: str) -> bool:
        target_len = len(word)
        if target_len == 0:
            return True

        board_i = len(board)
        board_j = len(board[0])
        not_available = [[False for _ in range(board_j)] for _ in range(board_i)]

        def visit(i, j, border_i, border_j, current, target):
            if current == target:
                self.found = True
                return
            if self.found or i < 0 or j < 0 or i == border_i or j == border_j or not_available[i][j] or board[i][j] != word[current]:
                return
            not_available[i][j] = True
            visit(i + 1, j, border_i, border_j, current + 1, target)
            visit(i - 1, j, border_i, border_j, current + 1, target)
            visit(i, j + 1, border_i, border_j, current + 1, target)
            visit(i, j - 1, border_i, border_j, current + 1, target)
            not_available[i][j] = False

        for i in range(board_i):
            for j in range(board_j):
                visit(i, j, board_i, board_j, 0, target_len)

        return self.found
