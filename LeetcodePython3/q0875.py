#!/usr/bin/python3
from typing import List


class Solution:
    def minEatingSpeed(self, piles: List[int], H: int) -> int:
        def vaild(number_try):
            count = 0
            for number in piles:
                count += number // number_try
                if number % number_try > 0:
                    count += 1
            return count <= H

        maxVal = piles[0]
        for number in piles:
            if maxVal < number:
                maxVal = number
        if H == len(piles):
            return maxVal

        left = 1
        right = maxVal
        result = 0
        while left <= right:
            mid = (left + right) // 2
            if vaild(mid):
                result = mid
                right = mid - 1
            else:
                left = mid + 1
        return result
