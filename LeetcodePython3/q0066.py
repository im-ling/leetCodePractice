#!/usr/bin/python3
from typing import List


class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        carry = 1
        index:int = len(digits) - 1
        while carry == 1 and index >= 0:
            digits[index] += 1
            carry = digits[index] // 10
            digits[index] %= 10
            index -= 1
        if index < 0 and carry == 1:
            digits.insert(0, 1)
        return digits

solu = Solution()
nums = [0]
result = solu.plusOne(nums)
print(result)