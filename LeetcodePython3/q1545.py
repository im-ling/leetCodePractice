#!/usr/bin/python3
from typing import List

class Solution:
    def findKthBit(self, n: int, k: int) -> str:
        s1 = list()
        s2 = [0]
        count = 1
        while count < n:
            s1 = s2
            s2 = list()
            for number in s1:
                s2.append(number)
            s2.append(1)
            for number in reversed(s1):
                s2.append(1 - number)
            count += 1
        return str(s2[k - 1])

