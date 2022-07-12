#!/usr/bin/python3
import functools
import heapq
import time
from collections import defaultdict
from typing import List

class Solution:
    def verticalTraversal(self, root: TreeNode) -> List[List[int]]:
        map = defaultdict(lambda: defaultdict(list))
        def visit(node: TreeNode, index: int, depth: int):
            if node:
                map[index][depth].append(node.val)
                visit(node.left, index - 1, depth + 1)
                visit(node.right, index + 1, depth + 1)
        visit(root, 0, 0)
        result = []
        for key in sorted(map.keys()):
            dic = map[key]
            tmp_list = []
            for key2 in sorted(dic.keys()):
                for item in sorted(dic[key2]):
                    tmp_list.append(item)
            result.append(map[key])
        return result



# class Solution:
#     def deleteDuplicateFolder(self, paths: List[List[str]]) -> List[List[str]]:
#         return []

# class Solution:
#     def maxCompatibilitySum(self, students: List[List[int]], mentors: List[List[int]]) -> int:
#         result = 0
#         length = len(students)
#         questions = len(students[0])
#
#         if length == 1:
#             ans_stu = students[0]
#             ans_men = mentors[0]
#             for i in range(questions):
#                 if ans_stu[i] == ans_men[i]:
#                     result += 1
#             return result
#         else:
#             max_val = 0
#             ans_stu = students.pop(0)
#             for i in range(length):
#                 tmp = 0
#                 ans_men = mentors.pop(i)
#                 for j in range(questions):
#                     if ans_stu[j] == ans_men[j]:
#                         tmp += 1
#                 max_val = max(max_val, tmp + self.maxCompatibilitySum(students, mentors))
#                 mentors.insert(i, ans_men)
#             students.insert(0, ans_stu)
#             return max_val

# stus = [[1,1,0],[1,0,1],[0,0,1]]
# mens = [[1,0,0],[0,0,1],[1,1,0]]
# result = Solution().maxCompatibilitySum(stus, mens)
# print(result)

# class Solution:
#     def maximumNumber(self, num: str, change: List[int]) -> str:
#         flag = False
#         found = False
#         result = ""
#         for char in num:
#             index = ord(char) - ord("0")
#             if not found and change[index] > index:
#                 found = True
#                 flag = True
#             if flag:
#                 if change[index] >= index:
#                     char = str(change[index])
#                 else:
#                     flag = not flag
#             result += char
#         return result


# class Solution:
#     def getLucky(self, s: str, k: int) -> int:
#         result = 0
#         for char in s:
#             number = ord(char) - ord("a") + 1
#             if number >= 10:
#                 result += number % 10 + number // 10
#             else:
#                 result += number
#         k -= 1
#         while k > 0:
#             last = result
#             result = 0
#             while last > 0:
#                 result += last % 10
#                 last //= 10
#             k -= 1
#         return result
