#!/usr/bin/python3
from typing import List

class Solution:
    def findSmallestSetOfVertices(self, n: int, edges: List[List[int]]) -> List[int]:
        sets = {0}
        for i in range(n):
            sets.add(i)
        for edge in edges:
            if edge[1] in sets:
                sets.remove(edge[1])
        result = list()
        for item in sets:
            result.append(item)
        return result
