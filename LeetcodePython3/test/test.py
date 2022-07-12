from typing import List


class NumArray:
    _nums = []

    def __init__(self, nums: List[int]):
        self._nums = [0]
        for i in range(len(nums)):
            self._nums.append(self._nums[i] + nums[i])

    def sumRange(self, left: int, right: int) -> int:
        return self._nums[right + 1] - self._nums[left]


# Your NumArray object will be instantiated and called as such:
obj = NumArray([-2, 0, 3, -5, 2, -1])
param_1 = obj.sumRange(0, 2)
print(param_1)