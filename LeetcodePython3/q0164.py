#!/usr/bin/python3
from typing import List


class Solution:
    def maximumGap(self, nums: List[int]) -> int:
        if len(nums) < 2:
            return 0

        _set = set()
        for num in nums:
            _set.add(num)

        def bucketSort(nums: List[int]) -> List[int]:
            length = len(nums)
            if length < 2:
                return nums
            result = list()
            min = nums[0]
            max = nums[0]
            for num in nums:
                if min > num:
                    min = num
                if max < num:
                    max = num
            # if max == min:
            #     return nums
            step = (max - min) // length + 1
            matrix = [[] for _ in range(length)]
            for num in nums:
                matrix[(num - min) // step].append(num)
            for array in matrix:
                sorted_array = bucketSort(array)
                for ele in sorted_array:
                    result.append(ele)
            return result

        sorted_nums = bucketSort(list(_set))
        result = 0
        last = sorted_nums[0]
        for num in sorted_nums:
            if result < num - last:
                result = num - last
            last = num
        return result
