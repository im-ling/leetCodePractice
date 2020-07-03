#!/usr/bin/python3
from typing import List

class Solution:
    def prisonAfterNDays(self, cells: List[int], N: int) -> List[int]:
        number = 0
        for cell in cells:
            number = (number << 1) + cell
        dic = {number: 0}
        i = 1
        while i <= N:
            number = (number << 1) ^ (number >> 1)
            number = (~number) & 0x7E
            if number in dic:
                loop = i - dic[number]
                N = (N - i) % loop + i
                dic = {}
            else:
                dic[number] = i
            i += 1
        result = []
        for i in reversed(range(8)):
            result.append((number & (1 << i)) >> i)
        return result

solu = Solution()
cells = [1,0,0,1,0,0,1,0]
N = 1000000000
result = solu.prisonAfterNDays(cells, N)
print(result)
