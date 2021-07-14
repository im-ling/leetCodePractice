from typing import List


class Solution:
    def minAbsoluteSumDiff(self, nums1: List[int], nums2: List[int]) -> int:
        _set = set()
        for num in nums1:
            _set.add(num)
        sorted_num1 = list(_set)
        sorted_num1.sort()

        length = len(nums1)
        factor = pow(10, 9) + 7

        def found_diff(number):
            min_diff = 1000000
            left = 0
            right = len(sorted_num1) - 1
            while left <= right:
                mid = (left + right) >> 1
                if abs(number - sorted_num1[mid]) < min_diff:
                    min_diff = abs(number - sorted_num1[mid])
                if sorted_num1[mid] <= number:
                    left = mid + 1
                else:
                    right = mid - 1
            return min_diff

        max_dif = 0
        result = 0
        for i in range(length):
            result = (result + abs(nums1[i] - nums2[i])) % factor
            min_diff = found_diff(nums2[i])
            if max_dif < abs(nums1[i] - nums2[i]) - min_diff:
                max_dif = abs(nums1[i] - nums2[i]) - min_diff

        result = (result - max_dif + factor) % factor
        return result


nums1 = [1, 7, 5]
nums2 = [2, 3, 5]
result = Solution().minAbsoluteSumDiff(nums1, nums2)
print(result)
