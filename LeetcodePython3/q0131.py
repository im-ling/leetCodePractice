#!/usr/bin/python3
from typing import List


class Solution:
    def partition(self, s: str) -> List[List[str]]:
        def getMatrix(s: str) -> List[List[str]]:
            s_len = len(s)
            is_palindrome_matrix = [[False for _ in range(s_len)] for _ in range(s_len)]
            for i in range(s_len):
                is_palindrome_matrix[i][i] = True

            start = s_len - 1
            while start >= 0:
                end = start + 1
                while end < s_len:
                    if s[start] == s[end] and (end - start == 1 or is_palindrome_matrix[start + 1][end - 1]):
                        is_palindrome_matrix[start][end] = True
                    end += 1
                start -= 1
            return is_palindrome_matrix

        palindrome_matrix = getMatrix(s)
        # print(palindrome_matrix)
        s_len = len(s)
        combinations = [list() for _ in range(s_len)]

        def getCombination(s: str, start: int, end: int, matrix):
            if start >= end:
                return [[]]
            if len(combinations[start]) > 0:
                return combinations[start]
            for index in range(start, end):
                if matrix[start][index]:
                    prefix = [s[start: index + 1]]
                    for item in getCombination(s, index + 1, end, matrix):
                        combinations[start].append(prefix + item)
            return combinations[start]
        return getCombination(s, 0, s_len, palindrome_matrix)


s = "aab"
result = Solution().partition(s)
print(result)