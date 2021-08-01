import heapq
from typing import List


class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        heap = []
        for i in range(len(mat))
            array = mat[i]
            count = 0
            for number in array:
                if number == 0:
                    break
                count += 1
            heapq.heappush(heap, [count, i])
        result = []
        for _ in range(k):
            pair = heapq.heappop(heap)
            result.append(pair[1])
        return result