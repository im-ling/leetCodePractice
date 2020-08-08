#!/usr/bin/python3
from typing import List

class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        result = 1
        index = 0
        count = 0
        while count != k:
            if index >= len(arr):
                result += k - count
            if result == arr[index]:
                index += 1
            else:
                count += 1
            result += 1
        return result
