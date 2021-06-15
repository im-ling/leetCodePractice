#!/usr/bin/python3
from typing import List

class Solution:
    def canWinNim(self, n: int) -> bool:
        return n & 0x3 > 0
