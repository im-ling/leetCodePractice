#!/usr/bin/python3
from typing import List

class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        length = len(stones)
        while length > 1:
            stones = sorted(stones)
            # print(stones)
            a = stones.pop()
            b = stones.pop()
            length -= 2
            if a == b:
                continue
            else:
                index = 0
                result = abs(a - b)
                while index < length and stones[index] < result:
                    index += 1
                stones.insert(index, result)
                length += 1
        if len(stones) == 0:
            return 0
        return stones[0]

stones = [2,7,4,1,8,1]
result = Solution().lastStoneWeight(stones)
print(result)

[31,26,33,21,40]
[1,2]
