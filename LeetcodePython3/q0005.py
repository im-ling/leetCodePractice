#!/usr/bin/python3
from typing import List


class Solution:
    def longestPalindrome(self, s: str) -> str:
        length = len(s)
        dp = [[False for _ in range(length)] for _ in range(length)]
        chars = [s[i] for i in range(length)]

        index_i = 0
        index_j = 0

        for i in range(length):
            dp[i][i] = True
        i = length - 2
        while i >= 0:
            j = i + 1
            while j < length:
                if chars[i] == chars[j]:
                    if j - i == 1:
                        dp[i][j] = True
                    else:
                        dp[i][j] = dp[i + 1][j - 1]
                if dp[i][j] and j - i > index_j - index_i:
                    index_j = j
                    index_i = i
                j += 1
            i -= 1

        return s[index_i: index_j + 1]

s = "babad"
result = Solution().longestPalindrome(s)
print(result)