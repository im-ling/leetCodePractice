#!/usr/bin/python3
from typing import List

class Solution:
    def threeConsecutiveOdds(self, arr: List[int]) -> bool:
        count = 0
        for number in arr:
            if number & 0x1 == 0x1:
                count += 1
                if count == 3:
                    return True
            else:
                count = 0
        return False
