#!/usr/bin/python3
from typing import List


class Solution:
    def maxProfit(self, k: int, prices: List[int]) -> int:
        length = len(prices)
        if length < 2:
            return 0
        dp = [[0 for _ in range(length + 1)] for _ in range(k + 1)]
        for i in range(1, k + 1):
            buy = prices[0]
            for j in range(1, length + 1):
                dp[i][j] = max(dp[i][j - 1], prices[j - 1] - buy)
                buy = min(buy, prices[j - 1] - dp[i - 1][j - 1])
        return dp[k][length]


