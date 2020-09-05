#!/usr/bin/python3
from typing import List


class Solution:
    def partitionLabels(self, S: str) -> List[int]:
        final_map = {}
        for i in reversed(range(len(S))):
            if S[i] not in final_map:
                final_map[S[i]] = i
        current_map = {}
        count = 0
        result = list()
        for i in range(len(S)):
            count += 1
            current_map[S[i]] = i
            if final_map[S[i]] == i:
                current_map.pop(S[i])
            if len(current_map.keys()) == 0:
                result.append(count)
                count = 0
        return result
