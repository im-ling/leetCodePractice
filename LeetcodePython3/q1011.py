#!/usr/bin/python3
from typing import List


class Solution:
    def shipWithinDays(self, weights: List[int], D: int) -> int:
        maxVal = weights[0]
        sum = 0
        for weight in weights:
            if maxVal < weight:
                maxVal = weight
            sum += weight
        if D == len(weights):
            return maxVal
        if D == 1:
            return sum

        def validWeight(weight_try: int):
            count = 0
            local_sum = 0
            for weight in weights:
                local_sum += weight
                if local_sum > weight_try:
                    local_sum = weight
                    count += 1
            return count < D

        left = maxVal
        right = sum
        result = 0
        while left <= right:
            mid = (left + right) // 2
            if validWeight(mid):
                result = mid
                right = mid - 1
            else:
                left = mid + 1
        return result
