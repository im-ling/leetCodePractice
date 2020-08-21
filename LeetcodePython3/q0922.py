#!/usr/bin/python3
from typing import List

class Solution:
    def sortArrayByParityII(self, A: List[int]) -> List[int]:
        left = 0
        length = len(A)
        right = length - 1
        while left < length:
            while left < length and A[left] & 0x1 == 0:
                left += 2
            while right > 0 and A[right] & 0x1 == 1:
                right -= 2
            if left < length and right > 0:
                temp = A[left]
                A[left] = A[right]
                A[right] = temp
                left += 2
                right -= 2
        return A