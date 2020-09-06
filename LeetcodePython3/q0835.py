#!/usr/bin/python3
from typing import List
from copy import deepcopy

class Solution:
    def largestOverlap(self, A: List[List[int]], B: List[List[int]]) -> int:
        flag_list = list()
        len_row = len(B)
        len_col = len(B[0])
        for i in range(len_row):
            for j in range(len_col):
                if B[i][j] == 1:
                    flag_list.append([i, j])

        def countOverLapNum(target: List[List[int]], flags: List[List[int]], offset_row: int, offset_col: int, _len_row: int, _len_col: int) -> int:
            local_count = 0
            for pair in flags:
                row = pair[0] + offset_row
                col = pair[1] + offset_col
                if 0 <= row < _len_row and 0 <= col < _len_col and target[row][col] == 1:
                    local_count += 1
            return local_count

        result = 0
        i = -len_row + 1
        while i < len_row:
            j = -len_col + 1
            while j < len_col:
                count = countOverLapNum(A, flag_list, i, j, len_row, len_col)
                if result < count:
                    result = count
                j += 1
            i += 1
        return result






