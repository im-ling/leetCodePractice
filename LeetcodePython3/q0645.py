from typing import List


class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        length = len(nums)
        sum = (1 + length) * length // 2
        _set = set()
        result = []
        for num in nums:
            if num not in _set:
                _set.add(num)
                sum -= num
            else:
                result.append(num)
        result.append(sum)
        return result
