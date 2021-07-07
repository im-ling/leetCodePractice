import heapq


class Solution:
    def nthUglyNumber(self, n: int) -> int:
        min_heap = [1]
        result = [0]
        count = 0
        while count < n:
            cur = heapq.heappop(min_heap)
            while cur == result[-1]:
                cur = heapq.heappop(min_heap)
            result.append(cur)
            count += 1
            heapq.heappush(min_heap, cur * 2)
            heapq.heappush(min_heap, cur * 3)
            heapq.heappush(min_heap, cur * 5)
        return result[n]