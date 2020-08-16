from collections import deque
class Solution:
    def minDays(self, n: int) -> int:
        dic = {}
        bfs_queue = deque([[n, 0]])
        while bfs_queue:
            # print(bfs_queue)
            # print(dic)
            pair = bfs_queue.popleft()
            number = pair[0]
            times = pair[1]
            # found
            if number == 1:
                return times + 1
            if number not in dic:
                dic[number] = times
            else:
                continue
            dic[number] = times
            if number % 3 == 0:
                bfs_queue.append([number // 3, times + 1])
            if number % 2 == 0:
                bfs_queue.append([number // 2, times + 1])
            bfs_queue.append([number - 1, times + 1])
        return -1

print(Solution().minDays(84806671))