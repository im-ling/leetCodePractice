#!/usr/bin/python3
from typing import List
import sys


class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        m = amount
        dp: List[List[int]] = [sys.maxsize for i in range(m + 1)]
        dp[0] = 0
        for i in range(1, m + 1):
            for coin in coins:
                if coin <= i:
                    dp[i] = min(dp[i], dp[i - coin] + 1)
        if dp[m] == sys.maxsize:
            dp[m] = -1
        return dp[m]


solu = Solution()
coins = [1,2,5]
amount = 11
result = solu.coinChange(coins, amount)
print(result)