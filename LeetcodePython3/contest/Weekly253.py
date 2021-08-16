#!/usr/bin/python3
import functools
import heapq
import time
from collections import defaultdict
from typing import List

class Solution:
    def longestObstacleCourseAtEachPosition(self, obstacles: List[int]) -> List[int]:
        length = len(obstacles)
        stack = [0 for _ in range(length)]
        stack[0] = obstacles[0]
        stack_count = 1
        result = [1]
        for i in range(1, length):
            num = obstacles[i]
            # 大于最后一个值
            if num >= stack[stack_count - 1]:
                stack[stack_count] = num
                stack_count += 1
                result.append(stack_count)
            else:
                left = 0
                right = stack_count - 1
                index = -1
                while left <= right:
                    mid = (left + right) >> 1
                    if num >= stack[mid]:
                        index = mid
                        left = mid + 1
                    else:
                        right = mid - 1
                index += 1
                stack[index] = num
                result.append(index + 1)
        return result




nums = [3,1,5,6,4,2]
result = Solution().longestObstacleCourseAtEachPosition(nums)
print(result)





# class Solution:
#     def minSwaps(self, s: str) -> int:
#         left_count = 0
#         right_count = 0
#         for char in s:
#             if char == "[":
#                 left_count += 1
#             else:
#                 if left_count > 0:
#                     left_count -= 1
#                 else:
#                     right_count += 1
#         return (right_count + 1) >> 1

# class Solution:
#     def minStoneSum(self, piles: List[int], k: int) -> int:
#         heap = []
#         for item in piles:
#             heapq.heappush(heap, -item)
#         for i in range(k):
#             cur = -heapq.heappop(heap)
#             cur = cur - (cur >> 1)
#             heapq.heappush(heap, -cur)
#         result = 0
#         while heap:
#             result += -heapq.heappop(heap)
#         return result

# class Solution:
#     def isPrefixString(self, s: str, words: List[str]) -> bool:
#         cur = ""
#         for word in words:
#             cur += word
#             if s == cur:
#                 return True
#         return False


