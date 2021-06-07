#!/usr/bin/python3
from typing import List


class Solution:
    def findMaxForm(self, strs: List[str], m: int, n: int) -> int:
        length = len(strs)
        dp = [[[0 for _ in range(n + 1)] for _ in range(m + 1)] for _ in range(1 + length)]
        wordMap = {}

        def cal_ones_zeros(word: str):
            if word in wordMap:
                return wordMap[word]
            zeros = 0
            ones = 0
            for char in word:
                if char == "0":
                    zeros += 1
                else:
                    ones += 1
            array = [zeros, ones]
            wordMap[word] = array
            return array

        for i in range(1, 1 + length):
            for j in range(0, 1 + m):
                for k in range(0, 1 + n):
                    array = cal_ones_zeros(strs[i - 1])
                    if j >= array[0] and k >= array[1]:
                        dp[i][j][k] = max(dp[i - 1][j][k], dp[i - 1][j - array[0]][k - array[1]] + 1)
                    else:
                        dp[i][j][k] = dp[i - 1][j][k]

        return dp[length][m][n]