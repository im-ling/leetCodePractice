#!/usr/bin/python3
from typing import List

class Solution:
    def sortArrayByParity(self, A: List[int]) -> List[int]:
        left = 0
        right = len(A) - 1
        while left < right:
            while left < right and A[left] & 0x1 == 0:
                left += 1
            while left < right and A[right] & 0x1 == 1:
                right -= 1
            if left < right:
                temp = A[left]
                A[left] = A[right]
                A[right] = temp
                left += 1
                right -= 1
        return A