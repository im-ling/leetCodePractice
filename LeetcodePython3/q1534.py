#!/usr/bin/python3
from typing import List

class Solution:
    def countGoodTriplets(self, arr: List[int], a: int, b: int, c: int) -> int:
        result = 0
        length = len(arr)
        for i in range(length):
            j = i + 1
            while j < length:
                k = j + 1
                while k < length:
                    k += 1
                    if abs(arr[i] - arr[j]) <= a and abs(arr[j] - arr[k]) <= b and abs(arr[i] - arr[k]) <= c:
                        result += 1
                j += 1
        return result
