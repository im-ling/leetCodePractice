#!/usr/bin/python3
import functools
import heapq
import time
from collections import defaultdict, deque
from typing import List


class Solution:
    def numberOfGoodSubsets(self, nums: List[int]) -> int:
        factor = pow(10, 9) + 7
        result = 0
        the_set = {1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29}
        map = {}
        for num in the_set:
            map[num] = 1
        for num in nums:
            if num in map:
                cur = 1
                for key in the_set:
                    if key != num:
                        cur *= map[key]
                result = (result + cur) % factor
                map[num] += 1
        return result

# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.children = []
#
# class LockingTree:
#     parent = []
#     status = []
#     length = 0
#
#     def __init__(self, parent: List[int]):
#         self.parent = parent
#         self.length = len(parent)
#         node_list = [TreeNode(0) for _ in range(self.length)]
#         for i in range(self.length):
#             p = parent[i]
#             if p != -1:
#                 node_list[p].children.append(node_list[i])
#         self.nodes = node_list
#
#     def lock(self, num: int, user: int) -> bool:
#         if num < self.length and self.nodes[num].val == 0:
#             self.nodes[num].val = user
#             return True
#         return False
#
#     def unlock(self, num: int, user: int) -> bool:
#         if num < self.length and self.nodes[num].val == user:
#             self.nodes[num].val = 0
#             return True
#         return False
#
#     def upgrade(self, num: int, user: int) -> bool:
#         flag = False
#         if num < self.length:
#             p = num
#             while p != -1 and self.nodes[p].val == 0:
#                 p = self.parent[p]
#             if p == -1:
#                 bfs_queue = deque(self.nodes[num].children)
#                 while bfs_queue:
#                     cur = bfs_queue.popleft()
#                     if cur.val != 0:
#                         cur.val = 0
#                         flag = True
#                     for node in cur.children:
#                         bfs_queue.append(node)
#                 if flag:
#                     self.nodes[num].val = user
#         return flag

# parents = [-1,0,0,1,1,2,2]
# obj = LockingTree(parents)
# print(obj.lock(2, 2))
# print(obj.unlock(2, 3))
# print(obj.unlock(2, 2))
# print(obj.lock(4, 5))
# print(obj.upgrade(0, 1))
# print(obj.lock(0, 1))

parents = [-1,4,9,0,6,1,0,6,3,1]
obj = LockingTree(parents)

command = ["upgrade","upgrade","upgrade","upgrade","upgrade","lock","unlock","upgrade","upgrade","upgrade","lock","upgrade","upgrade","upgrade","lock","unlock","upgrade","unlock","unlock","upgrade"]
param = [[9,43],[4,27],[5,34],[7,31],[4,27],[2,47],[7,21],[4,12],[1,1],[8,20],[5,50],[5,28],[0,11],[6,19],[9,27],[5,6],[0,5],[4,49],[4,22],[5,27]]

result = []
for i in range(len(command)):
    method_to_call = getattr(obj, command[i])
    result.append(method_to_call(param[i][0], param[i][1]))
print(result)
# class Solution:
#     def findFarmland(self, land: List[List[int]]) -> List[List[int]]:
#         m = len(land)
#         n = len(land[0])
#         left = []
#         result = []
#         for i in range(m):
#             for j in range(n):
#                 if land[i][j] == 1 and (i == 0 or land[i - 1][j] == 0) and (j == 0 or land[i][j - 1] == 0):
#                     left.append([i, j])
#         for (i, j) in left:
#             k = i
#             while k < m and land[k][j] == 1:
#                 k += 1
#             k -= 1
#             l = j
#             while l < n and land[k][l] == 1:
#                 l += 1
#             l -= 1
#             result.append([i, j, k, l])


# class Solution:
#     def findMiddleIndex(self, nums: List[int]) -> int:
#         right = 0
#         for num in nums:
#             right += num
#         left = 0
#         for i in range(len(nums)):
#             right -= nums[i]
#             if left == right:
#                 return i
#             left += nums[i]
#         return -1
