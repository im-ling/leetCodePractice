#!/usr/bin/python3
from typing import List


class Solution:
    def numSubmat(self, mat: List[List[int]]) -> int:
        M = len(mat)
        N = len(mat[0])
        result = 0
        for i in range(M):
            h = [1 for _ in range(N)]
            for j in range(i, M):
                for k in range(N):
                    h[k] &= mat[j][k]
                result += self.countN(h)
        return result

    def countN(self, array: List[int]) -> int:
        total = 0
        current = 0
        for i in array:
            if i == 1:
                current += 1
                total += current
            else:
                current = 0
        return total


mat = [[1,1,1,1,1,1]]
solu = Solution()
result = solu.numSubmat(mat)
print(result)