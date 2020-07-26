#!/usr/bin/python3
from typing import List

class Solution:
    def restoreString(self, s: str, indices: List[int]) -> str:
        result = ""
        dic = {}
        for i in range(len(indices)):
            dic[indices[i]] = s[i]
        for i in range(len(indices)):
            result += dic[i]
        return result