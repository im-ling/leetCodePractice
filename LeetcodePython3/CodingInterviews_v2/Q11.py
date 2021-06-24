#!/usr/bin/python3
from typing import List


class Solution:
    min_val = -1
    found = False

    def minArray(self, numbers: List[int]) -> int:
        length = len(numbers)
        if length == 0:
            return self.min_val
        self.min_val = numbers[0]
        self.found = False

        def inner_search(left, right):
            print(left, right)
            if self.found or left > right:
                return

            if numbers[left] < numbers[right]:
                if numbers[left] < numbers[(left - 1 + length) % length]:
                    self.found = True
                    self.min_val = numbers[left]
                return

            mid = (left + right) >> 1
            if numbers[mid] < numbers[(mid - 1 + length) % length]:
                self.found = True
                self.min_val = numbers[mid]
            else:
                inner_search(left, mid - 1)
                inner_search(mid + 1, right)

        inner_search(0, length - 1)
        return self.min_val

nums = [3,4,5,1,2]
result = Solution().minArray(nums)
print(result)