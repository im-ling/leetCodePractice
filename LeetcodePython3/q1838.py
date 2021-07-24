from typing import List


class Solution:
    def maxFrequency(self, nums: List[int], k: int) -> int:
        nums.sort()
        length = len(nums)
        start = 0
        sum = 0
        result = 1
        for i in range(length):
            num = nums[i]
            sum += num
            if sum + k >= num * (i - start + 1):
                if result < (i - start + 1):
                    result = i - start + 1
            else:
                while sum + k < num * (i - start + 1):
                    sum -= nums[start]
                    start += 1
        return result


nums = [9940,9995,9944,9937,9941,9952,9907,9952,9987,9964,9940,9914,9941,9933,9912,9934,9980,9907,9980,9944,9910,9997]
k = 7925
result = Solution().maxFrequency(nums,k)
print(result)
