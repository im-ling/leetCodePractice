#!/usr/bin/python3
import functools
import heapq
import time
from collections import defaultdict
from typing import List


# class Solution:
#     def countSpecialSubsequences(self, nums: List[int]) -> int:
#         factor = pow(10, 9) + 7
#         length = len(nums)
#         dp = [[0 for _ in range(length + 1)] for _ in range(3)]
#         for i in range(length):
#             num = nums[i]
#             for j in range(3):
#                 dp[j][i + 1] = dp[j][i] % factor
#             if num == 0:
#                 dp[0][i + 1] = (dp[0][i] * 2 + 1) % factor
#             elif num == 1:
#                 dp[1][i + 1] = (dp[1][i] * 2 + dp[0][i]) % factor
#             else:
#                 dp[2][i + 1] = (dp[2][i] * 2 + dp[1][i]) % factor
#         return dp[2][length]



# nums = [2,0,0,1,2,0,2,1,2,2,2,2,2,2,1,0,2,0,2,2,1,1,2,1,1,0,1,0,2,1,2,0,1,2,1,2,0,0,2,0,2,1,0,0,0,1,1,0,1,2,1,2,2,0,1,2,0,0,1,2,1,1,2,0,1,2,1,0,1,0,1,1,2,0,0,0,1,1,1,2,1,0,0,0,0,2,2,1,1,1,2,1,2,0,1,0,0,1,0,1,1,0,0,1,1,1,1,1,0,2,1,1,0,0,2,0,2,2,1,0,2,2,2,0,0,1,2,1,1,2,1,2,1,1,1,1,2,0,2,0,1,0,2,0,2,0,0,1,2,1,1,0,2,0,1,0,2,1,1,0,0,1,1,0,1,0,2,1,2,0,0,0,1,1,1,1,1,1,2,2,0,2,2,2,1,0,0,0,1,1,0,2,1,1,2,1,0,1,0,0,2,1,0,2,1,1,1,0,2,2,2,1,1,0,2,1,0,1,0,0,2,1,2,0,0,2,1,1,0,1,1,1,1,1,1,2,1,2,1,1,0,0,2,0,1,0,0,0,2,1,1,2,1,1,0,0,2,0,1,2,1,1,1,0,2,1,1,0,0,1,2,1,1,1,2,0,1,0,2,2,2,2,0,2,2,2,2,0,1,0,2,1,1,2,1,2,1,2,2,1,2,0,2,2,0,0,2,0,1,2,2,2,2,0,1,1,0,0,1,2,0,2,2,1,1,1,0,1,1,0,1,1,2,0,2,0,1,1,0,0,2,0,2,1,2,1,1,0,0,2,2,1,0,0,0,0,0,1,2,0,0,0,1,1,1,1,2,0,1,1,0,0,0,1,0,2,1,0,2,0,1,0,2,0,1,1,2,2,0,1,0,0,2,1,1,2,1,1,2,2,0,1,2,0,2,2,0,0,2,0,0,2,2,2,2,2,0,1,2,0,1,0,1,1,0,1,1,2,1,0,1,2,1,2,1,1,1,2,2,1,0,1,1,2,2,2,0,0,1,2,1,2,2,1,1,0,2,2,2,2,2,1,1,2,2,2,0,0,0,2,2,0,1,1,1,1,0,1,0,0,1,2,0]
# result = Solution().countSpecialSubsequences(nums)
# print(result)



# class Solution:
#     def minimumPerimeter(self, neededApples: int) -> int:
#         result = 0
#         sum = 0
#         dis = 0
#         while sum < neededApples:
#             result += 8
#             dis += 1
#             sum += dis * dis * 12
#         return result
# neededApples = 100000000000000
# result = Solution().minimumPerimeter(neededApples)
# print(result)



# class Solution:
#     def numberOfWeeks(self, milestones: List[int]) -> int:
#         sum = 0
#         max_val = 0
#         for time in milestones:
#             sum += time
#             if time > max_val:
#                 max_val = time
#         result = sum
#         if (max_val - 1) * 2 > sum - 1:
#             result = (sum - max_val) * 2 + 1
#         return result



# class Solution:
#     def isThree(self, n: int) -> bool:
#         count = 0
#         for i in range(1, n + 1):
#             if n % i == 0:
#                 count += 1
#         return count == 3
#
#     def isThree2(self, n: int) -> bool:
#         if n < 2:
#             return False
#         square_root = int(sqrt(n))
#         if square_root * square_root != n:
#             return False
#         n = square_root
#         square_root = int(sqrt(n))
#         for i in range(2, square_root + 1):
#             if n % i == 0:
#                 return False
#         return True
