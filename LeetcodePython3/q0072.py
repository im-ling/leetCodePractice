#!/usr/bin/python3
from typing import List
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        len_col = len(word1) + 1
        len_row = len(word2) + 1
        dp = [[0 for _ in range(len_col)] for _ in range(len_row)]
        for i in range(len_row):
            dp[i][0] = i
        for i in range(len_col):
            dp[0][i] = i
        for i in range(1, len_row):
            for j in range(1, len_col):
                if word1[j - 1] == word2[i - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1])) + 1
        return dp[len_row - 1][len_col - 1]