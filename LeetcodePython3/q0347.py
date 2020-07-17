#!/usr/bin/python3
from typing import List

class Solution:
    def swap(self, nums: List[int], i: int, j: int):
        temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp

    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        dic = {}
        for num in nums:
            if num not in dic:
                dic[num] = 1
            else:
                dic[num] += 1

        keys = list()
        values = list()
        for key in dic.keys():
            keys.append(key)
            values.append(dic[key])

        left = 0
        right = len(values) - 1
        index = 0
        k = k - 1
        # print(keys)
        # print(values)
        while True:
            lastright = right
            index = left + 1
            while index <= right:
                if values[index] < values[left]:
                    self.swap(values, index, right)
                    self.swap(keys, index, right)
                    right -= 1
                else:
                    index += 1

            index -= 1
            self.swap(values, index, left)
            self.swap(keys, index, left)

            # print(keys)
            # print(values)
            # print(index)
            if index == k:
                break
            elif index < k:
                left = index + 1
                right = lastright
            else:
                right = index - 1
        return keys[:k + 1]


solu = Solution()
nums = [3,0,1,0]
k = 1
result = solu.topKFrequent(nums,k)
print(result)