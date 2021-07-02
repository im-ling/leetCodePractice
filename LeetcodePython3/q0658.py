from typing import List


class Solution:
    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:
        length = len(arr)
        if length == k:
            return arr

        index_x = 0
        near_abs = 10000
        left = 0
        right = length - 1
        while left <= right:
            mid = (left + right) >> 1
            tmp = abs(arr[mid] - x)
            if near_abs > tmp:
                near_abs = tmp
                index_x = mid
            if near_abs == 0:
                break
            if arr[mid] < x:
                left = mid + 1
            else:
                right = mid - 1

        left = index_x - 1
        right = index_x + 1
        tk = k - 1
        while tk > 0 and left >= 0 and right < length:
            if abs(arr[left] - x) <= abs(arr[right] - x):
                left -= 1
            else:
                right += 1
            tk -= 1

        if left < 0:
            return arr[:k]
        if right == length:
            return arr[-k:]
        return arr[left + 1: right]


arr = [0,0,1,2,3,3,4,7,7,8]
result = Solution().findClosestElements(arr, 3, 5)
print(result)