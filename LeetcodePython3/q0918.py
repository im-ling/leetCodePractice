from typing import List


class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        max_val = -30000
        min_val = 30000
        cur_max = 0
        cur_min = 0
        sum = 0
        for num in nums:
            sum += num
            cur_max += num
            print(max_val, cur_max)
            max_val = max(max_val, cur_max)
            cur_min += num
            min_val = min(min_val, cur_min)
            if cur_max < 0:
                cur_max = 0
            if cur_min > 0:
                cur_min = 0
        if max_val < 0:
            return max_val
        if sum - min_val > max_val:
            return sum - min_val
        else:
            return max_val

nums = [-2, -3, -1]
result = Solution().maxSubarraySumCircular(nums)
print(result)




# nums = [88,-35,50,-38,-60,-31,-2,-8,-8,91,-14,50,-25,-26,1,71,-91,-64,-40,46,30,-97,9,-55,-36,-75,71,99,90,-53,-68,-20,-73,89,-14,74,-8,72,82,48,45,2,-42,12,77,22,87,56,73,-21,78,15,-6,-75,24,46,-11,-70,-90,-77,57,43,-66,10,-30,-47,91,-37,-4,-67,-88,19,66,29,86,97,-4,67,54,-92,-54,71,-42,-17,57,-91,-9,-15,-26,56,-57,-58,-72,91,-55,35,-20,29,51,70]
# result = Solution().maxSubarraySumCircular(nums)
# print(result)