#!/usr/bin/python3
import functools
import heapq
import time
from collections import defaultdict, deque
from typing import List


# class Solution:
#     def minSessions(self, tasks: List[int], sessionTime: int) -> int:
#         tasks.sort()
#         tasks = tasks[::-1]
#
#         length = len(tasks)
#         flags = [True for _ in range(length)]
#         result = 0
#
#         count_left = length
#         cur_left = sessionTime
#
#         while count_left > 0:
#             found = False
#             for i in range(length):
#                 if flags[i] and tasks[i] < cur_left:
#                     found = True
#                     count_left -= 1
#                     cur_left -= tasks[i]
#             if not found:
#                 cur_left = sessionTime
#                 result += 1
#         if sessionTime != cur_left:
#             result += 1
#         return result
#
# tasks = [2, 3, 3, 4, 4, 4, 6, 7, 8, 9, 10]
# result = Solution().minSessions(tasks, 15)
# print(result)


class Solution:
    result = 0
    countLeft = 0

    def minSessions(self, tasks: List[int], sessionTime: int) -> int:
        tasks.sort()
        tasks = tasks[::-1]
        length = len(tasks)
        flags = [True for _ in range(length)]
        self.result = length
        self.countLeft = length

        step = 0
        for i in range(length):
            if tasks[i] == sessionTime:
                step += 1
                self.countLeft -= 1
                flags[i] = False
            else:
                break

        try_found = True
        while try_found:
            try_found = False
            found = False
            for i in range(length - 1):
                if found:
                    break
                if not flags[i]:
                    continue
                for j in range(i + 1, length - 1):
                    if flags[j] and tasks[i] + tasks[j] == sessionTime:
                        try_found = True
                        found = True
                        flags[i] = False
                        flags[j] = False
                        self.countLeft -= 2
                        step += 1
                        break

        def helper(curLeft, curSteps, last):
            # print(curLeft, curSteps, flags)
            if self.result == 1 or curSteps >= self.result:
                return
            if self.countLeft <= 0:
                if self.result > curSteps:
                    self.result = curSteps
                return
            found = False
            for i in range(last + 1, length):
                break_flag = False
                if flags[i] and curLeft >= tasks[i]:
                    new_last = last
                    if i == last + 1:
                        break_flag = True
                        new_last += 1
                    found = True
                    flags[i] = False
                    self.countLeft -= 1
                    if curLeft == tasks[i]:
                        if self.countLeft == 0:
                            helper(sessionTime, curSteps, new_last)
                        else:
                            helper(sessionTime, curSteps + 1, new_last)
                    else:
                        helper(curLeft - tasks[i], curSteps, new_last)
                    self.countLeft += 1
                    flags[i] = True
                    if break_flag:
                        break
            if not found:
                helper(sessionTime, curSteps + 1, last)

        index = 0
        while index < length and not flags[index]:
            index += 1
        if index < length:
            flags[index] = False
            self.countLeft -= 1
            # print(self.countLeft, flags, tasks)
            helper(sessionTime - tasks[index], step + 1, index)
        else:
            self.result = step
        return self.result


[2,2,2,2,1,2,2,2,3,2,3,3]
9
[2, 3, 3, 4, 4, 4, 6, 7, 8, 9, 10]
15
tasks = [3,3,3,3,4,5,5,5,7,9]
sessionTime = 12
result = Solution().minSessions(tasks, sessionTime)
print(result)

# class Solution:
#     def kthLargestNumber(self, nums: List[str], k: int) -> str:
#         for i in range(len(nums)):
#             nums[i] = int(nums[i])
#         nums.sort()
#         return str(nums[-k])
#
# nums = ["0","0"]
# result = Solution().kthLargestNumber(nums, 2)
# print(result)

# class Solution:
#     def minimumDifference(self, nums: List[int], k: int) -> int:
#         nums.sort()
#         result = nums[-1] - nums[0]
#         for i in range(len(nums) - k + 1):
#             if result > nums[k + i - 1] - nums[i]:
#                 result = nums[k + i - 1] - nums[i]
#         return result
#
# nums = [90]
# result = Solution().minimumDifference(nums, 1)
# print(result)
