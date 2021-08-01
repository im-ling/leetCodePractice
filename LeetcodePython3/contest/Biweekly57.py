#!/usr/bin/python3
import functools
import heapq
import time
from collections import defaultdict
from typing import List


class Solution:
    def canSeePersonsCount(self, heights: List[int]) -> List[int]:
        length = len(heights)
        heights[length - 1] = 100000
        result = [1 for _ in range(length)]
        result[length - 1] = 0
        max_val = result[0]
        for i in reversed(range(length - 1)):
            if heights[i] > max_val:
                max_val = heights[i]
                result[i] = length - 1 - i
            else:
                j = i + 1
                while j < length and heights[i] > heights[j]:
                    j += heights[j]
                result[i] = j - i




# class Solution:
#     def splitPainting(self, segments: List[List[int]]) -> List[List[int]]:
#
#         segments.sort(key=lambda x:x[0])
#         result = [segments[0]]
#         length = len(segments)
#         start = 0
#         end = 1
#         for i in range(1, length):
#             segment = segments[i]
#             j = start
#             while j < end:
#                 if segment[0] >= segment[1]:
#                     break
#
#                 cur = result[j]
#                 if cur[1] <= segment[0]:
#                     start += 1
#                 elif cur[0] == segment[0]:
#                     if segment[1] >= cur[1]:
#                         cur[2] += segment[2]
#                         segment[0] = cur[1]
#                         if segment[1] == cur[1]:
#                             break
#                     else:
#                         segment[2] += cur[2]
#                         cur[0] = segment[1]
#                         result.insert(j, segment)
#                         end += 1
#                         break
#                 else:
#                     if segment[1] == cur[1]:
#                         cur[1] = segment[0]
#                         segment[2] += cur[2]
#                         result.insert(j + 1, segment)
#                         end += 1
#                         break
#                     elif segment[1] > cur[1]:
#                         to_add = [segment[0], cur[1], cur[2] + segment[2]]
#                         cur[1] = segment[0]
#                         result.insert(j + 1, to_add)
#                         segment[0] = to_add[1]
#                         j += 1
#                         end += 1
#                     else:
#                         last = [segment[1], cur[1], cur[2]]
#                         cur[1] = segment[0]
#                         result.insert(j + 1, [segment[0], segment[1], segment[2] + cur[2]])
#                         result.insert(j + 2, last)
#                         end += 2
#                         break
#                 j += 1
#                 # print(result)
#
#             if segment[0] >= result[end - 1][1] and segment[1] > segment[0]:
#                 result.append(segment)
#                 end += 1
#
#         return result
# t = [[4,5,9],[8,12,5],[4,7,19],[14,15,1],[3,10,8],[17,20,18],[7,19,14],[8,16,6],[14,17,7],[11,13,3]]
# result = Solution().splitPainting(t)
# print(result)

# class Solution:
#     def smallestChair(self, times: List[List[int]], targetFriend: int) -> int:
#         heap_enter = []
#         heap_leave = []
#         heap_available = []
#         map = {}
#         for i in range(len(times)):
#             heapq.heappush(heap_enter, [times[i][0], i])
#             heapq.heappush(heap_leave, [times[i][1], i])
#             heapq.heappush(heap_available, i)
#         while len(heap_enter) > 0:
#             enter = heap_enter[0]
#             leave = heap_leave[0]
#             if enter[0] < leave[0]:
#                 if enter[1] == targetFriend:
#                     return heap_available[0]
#                 else:
#                     map[enter[1]] = heapq.heappop(heap_available)
#                     print(map)
#                 heapq.heappop(heap_enter)
#             else:
#                 heapq.heappush(heap_available, map[leave[1]])
#                 heapq.heappop(heap_leave)
#         return -1
#
# times = [[3,10],[1,5],[2,6]]
# target = 2
# result = Solution().smallestChair(times, target)
# print(result)



# class Solution:
#     def areOccurrencesEqual(self, s: str) -> bool:
#         map = {}
#         for char in s:
#             if char not in map:
#                 map[char] = 1
#             else:
#                 map[char] += 1
#         count = map[s[0]]
#         for key in map.keys():
#             if map[key] != count:
#                 return False
#         return True