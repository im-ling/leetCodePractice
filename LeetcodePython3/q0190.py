#!/usr/bin/python3
from typing import List

class Solution:
    def reverseBits(self, n: int) -> int:
        result = 0
        for i in range(32):
            bit = n & 0x1
            result = (result << 1) + bit
            n >>= 1
        return result