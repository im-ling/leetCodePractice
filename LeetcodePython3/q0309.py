#!/usr/bin/python3
from typing import List

class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        length = len(prices)
        if length < 1:
            return 0
        dp = [[0 for col in range(length)] for row in range(3)]
        dp[0][0] = -prices[0]
        for i in range(1,length):
            dp[0][i] = max(dp[0][i - 1], dp[2][i - 1] - prices[i])
            dp[1][i] = dp[0][i - 1] + prices[i]
            dp[2][i] = max(dp[1][i - 1], dp[2][i - 1])
        return max(dp[1][length - 1], dp[2][length - 1])
