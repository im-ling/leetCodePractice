#!/usr/bin/python3
from typing import List

class Solution:
    def maxCoins(self, piles: List[int]) -> int:
        piles.sort()
        result = 0
        left = 0
        right = len(piles) - 2
        while left < right:
            result += piles[right]
            left += 1
            right -= 2
        return result
