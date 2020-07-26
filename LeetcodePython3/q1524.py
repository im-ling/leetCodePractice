#!/usr/bin/python3
from typing import List

class Solution:
    def numOfSubarrays(self, arr: List[int]) -> int:
        even = 1
        odd = 0
        sum = 0
        mod = 1000000007
        result = 0
        for number in arr:
            sum += number
            if sum % 2 == 1:
                result = (result + even) % mod
                odd += 1
            else:
                result = (result + odd) % mod
                even += 1
        return result



