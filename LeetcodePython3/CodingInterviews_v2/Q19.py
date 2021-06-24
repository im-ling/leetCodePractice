#!/usr/bin/python3
from typing import List


class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        len_s = len(s)
        len_p = len(p)
        dp = [[False for _ in range(len_p + 1)] for _ in range(len_s + 1)]

        dp[0][0] = True
        i = 2
        while i <= len_p:
            if p[i - 1] == "*":
                dp[0][i] = dp[0][i - 2]
            i += 2

        for i in range(1, len_s + 1):
            for j in range(1, len_p + 1):
                if s[i - 1] == p[j - 1] or p[j - 1] == ".":
                    dp[i][j] = dp[i - 1][j - 1]
                elif p[j - 1] == "*" and j > 1:
                    if dp[i][j - 2]:
                        dp[i][j] = True
                    elif p[j - 2] == "." or p[j - 2] == s[i - 1]:
                        if dp[i][j - 1] or dp[i - 1][j]:
                            dp[i][j] = True
        # for line in dp:
        #     for flag in line:
        #         if flag:
        #             print(1, end=" ")
        #         else:
        #             print(0, end=" ")
        #     print("")
        return dp[len_s][len_p]

s = "asdfasb"
p = ".*"
result = Solution().isMatch(s, p)
print(result)