import heapq
from collections import defaultdict, deque
from typing import List


class Solution:
    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:
        map = defaultdict(dict)
        for pair in times:
            map[pair[0]][pair[1]] = pair[2]

        reached = {}
        bfs_queue = deque([[k, 0]])

        while bfs_queue:
            cur = bfs_queue.popleft()
            target = cur[0]
            time = cur[1]
            if target not in reached or time < reached[target]:
                reached[target] = time
                for key in map[target].keys():
                    bfs_queue.append([key, time + map[target][key]])

        if len(reached.keys()) < n:
            return -1
        result = 0
        for key in reached.keys():
            if result < reached[key]:
                result = reached[key]
        return result


times = [[1,2,1],[2,3,7],[1,3,4],[2,1,2]]
n = 3
k = 2
result = Solution().networkDelayTime(times, n, k)
print(result)