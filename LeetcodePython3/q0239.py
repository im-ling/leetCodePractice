#!/usr/bin/python3
from typing import List
import heapq


class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        pq = []
        result = []
        for i in range(k):
            heapq.heappush(pq, [-nums[i], i])

        result.append(-pq[0][0])
        for i in range(k, len(nums)):
            heapq.heappush(pq, [-nums[i], i])
            while pq[0][1] <= i - k:
                heapq.heappop(pq)
            result.append(-pq[0][0])
        return result

    def maxSlidingWindow2(self, nums: List[int], k: int) -> List[int]:
        def inner_insert(list, ele):
            left = 0
            right = len(list) - 1
            if right < 0:
                list.append(ele)
                return list
            while left <= right:
                mid = (left + right) // 2
                if list[mid] <= ele:
                    left = mid + 1
                else:
                    right = mid - 1
            list.insert(left, ele)

        def inner_delete(list, ele):
            left = 0
            right = len(list) - 1
            while left <= right:
                mid = (left + right) // 2
                if list[mid] == ele:
                    list.pop(mid)
                    return
                elif list[mid] < ele:
                    left = mid + 1
                else:
                    right = mid - 1

        window = list()
        for i in range(k):
            inner_insert(window, nums[i])

        result = [window[k - 1]]
        for i in range(k, len(nums)):
            inner_delete(window, nums[i - k])
            inner_insert(window, nums[i])
            result.append(window[k - 1])
            # print(window)
        return result


nums = [1, 3, -1, -3, 5, 3, 6, 7]
k = 3
result = Solution().maxSlidingWindow(nums, k)
print(result)
