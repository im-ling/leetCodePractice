#!/usr/bin/python3
from typing import List


class Solution:
    def wonderfulSubstrings(self, word: str) -> int:
        pre = [0 for _ in range(1025)]
        pre[0] = 1
        cur = 0
        result = 0
        for char in word:
            index = 1 << (ord(char) - ord("a"))
            cur ^= index
            result += pre[cur]
            for i in range(10):
                result += pre[cur ^ (1 << i)]
            pre[cur] += 1
        return result

result = Solution().wonderfulSubstrings("aabb")
print(result)
