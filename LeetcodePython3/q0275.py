from typing import List


class Solution:
    def hIndex(self, citations: List[int]) -> int:
        result = 0
        length = len(citations)
        left = 0
        right = length - 1
        while left <= right:
            mid = (left + right) >> 1
            if length - mid >= citations[mid]:
                if result < citations[mid]:
                    result = citations[mid]
                left = mid + 1
            else:
                if result < length - mid:
                    result = length - mid
                right = mid - 1
        return result