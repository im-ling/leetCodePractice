#!/usr/bin/python3
import functools
import heapq
import time
from collections import defaultdict, deque
from typing import List


# 并查集模板
class UnionFind:
    def __init__(self, n: int):
        self.parent = list(range(n))
        self.size = [1] * n
        self.n = n
        # 当前连通分量数目
        self.setCount = n

    def findset(self, x: int) -> int:
        if self.parent[x] == x:
            return x
        self.parent[x] = self.findset(self.parent[x])
        return self.parent[x]

    def unite(self, x: int, y: int) -> bool:
        x, y = self.findset(x), self.findset(y)
        if x == y:
            return False
        if self.size[x] < self.size[y]:
            x, y = y, x
        self.parent[y] = x
        self.size[x] += self.size[y]
        self.setCount -= 1
        return True

    def connected(self, x: int, y: int) -> bool:
        x, y = self.findset(x), self.findset(y)
        return x == y
# 并查集
class Solution:
    def latestDayToCross(self, row: int, col: int, cells: List[List[int]]) -> int:
        length = len(cells)
        for i in range(length):
            cells[i][0] -= 1
            cells[i][1] -= 1
        grid = [[False for _ in range(col)] for _ in range(row)]

        n = row * col
        uf = UnionFind(n + 2)
        index = length - 1
        while index >= 0:
            (x, y) = cells[index]
            grid[x][y] = True
            print(index, grid)
            ele = x * col + y
            if x > 0 and grid[x - 1][y]:
                uf.unite(ele, ele - col)
            if x + 1 < row and grid[x + 1][y]:
                uf.unite(ele, ele + col)
            if y > 0 and grid[x][y - 1]:
                uf.unite(ele, ele - 1)
            if y + 1 < col and grid[x][y + 1]:
                uf.unite(ele, ele + 1)
            if x == 0:
                uf.unite(ele, n)
            if x == row - 1:
                uf.unite(ele, n + 1)
            if uf.connected(n, n + 1):
                return index
            index -= 1
        return 0




# class Solution:
#     def latestDayToCross(self, row: int, col: int, cells: List[List[int]]) -> int:
#         def isValid(n):
#             grid = [[True for _ in range(col)] for _ in range(row)]
#             for i in range(n):
#                 grid[cells[i][0]][cells[i][1]] = False
#             bfs_queue = deque([])
#             for i in range(col):
#                 if grid[0][i]:
#                     bfs_queue.append((0, i))
#                     grid[0][i] = False
#             # print(n, grid, bfs_queue)
#             while bfs_queue:
#                 (cur_x, cur_y) = bfs_queue.popleft()
#                 for (x, y) in [(cur_x + 1, cur_y), (cur_x - 1, cur_y), (cur_x, cur_y + 1), (cur_x, cur_y - 1)]:
#                     if 0 <= x < row and 0 <= y < col and grid[x][y]:
#                         if x == row - 1:
#                             return True
#                         grid[x][y] = False
#                         bfs_queue.append((x, y))
#             return False
#
#         length = len(cells)
#         left = 1
#         right = length
#         result = 0
#         for i in range(length):
#             cells[i][0] -= 1
#             cells[i][1] -= 1
#         while left <= right:
#             mid = (left + right) >> 1
#             if isValid(mid):
#                 result = mid
#                 left = mid + 1
#             else:
#                 right = mid - 1
#         return result

row = 33
col = 3
cells = [[26,1],[1,2],[30,2],[10,1],[20,1],[23,3],[9,1],[30,1],[16,1],[2,2],[23,2],[31,3],[21,1],[21,3],[15,3],[28,2],[24,2],[5,1],[33,1],[18,3],[9,2],[16,2],[21,2],[14,3],[19,2],[1,1],[20,2],[2,1],[12,3],[2,3],[25,2],[26,3],[25,3],[13,2],[19,3],[29,1],[4,2],[27,1],[3,2],[17,2],[6,3],[17,3],[31,1],[27,3],[8,2],[24,3],[29,2],[16,3],[12,1],[9,3],[6,2],[10,3],[33,2],[22,3],[22,2],[7,1],[18,1],[32,1],[14,1],[32,2],[1,3],[18,2],[11,3],[12,2],[28,1],[19,1],[24,1],[30,3],[11,2],[4,1],[4,3],[20,3],[8,1],[23,1],[7,3],[27,2],[22,1],[26,2],[15,2],[14,2],[28,3],[13,1],[5,2],[10,2],[6,1],[33,3],[15,1],[13,3],[3,3],[3,1],[31,2],[11,1],[5,3],[8,3],[32,3],[17,1],[7,2],[29,3],[25,1]]
result = Solution().latestDayToCross(row, col, cells)
print(result)


# class Solution:
#     def minNonZeroProduct(self, p: int) -> int:
#         if p < 2:
#             return p
#         factor = pow(10, 9) + 7
#
#         result = 1
#         for i in range(p):
#             result = (result * 2) % factor
#         result -= 1
#
#         base = result - 1
#         left = pow(2, p - 2)
#         while left > 0:
#             result = (result * base) % factor
#             base = (base * base) % factor
#             left >>= 1
#         return result
#
#
# result = Solution().minNonZeroProduct(60)
# print(result)

# class Solution:
#     def rearrangeArray(self, nums: List[int]) -> List[int]:
#         nums.sort()
#         result = []
#         left = 0
#         right = len(nums) - 1
#         while left <= right:
#             result.append(nums[left])
#             left += 1
#             if left > right:
#                 break
#             result.append(nums[right])
#             right -= 1
#         return result
# nums = [6,2,0,9,7]
# result = Solution().rearrangeArray(nums)
# print(result)


# class Solution:
#     def numOfStrings(self, patterns: List[str], word: str) -> int:
#         result = 0
#         for pattern in patterns:
#             if pattern in word:
#                 result += 1
#         return result
#
# result = Solution().numOfStrings(["a","abc","bc","d"], )