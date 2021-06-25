from typing import List


class Solution:
    def getLeastNumbers(self, arr: List[int], k: int) -> List[int]:
        if k >= len(arr):
            return arr

        def helper(left, right):
            # print(arr)
            # print(left,right)
            if left >= right or left >= k or right < k:
                return
            number = arr[left]
            pl = left + 1
            pr = right
            while pl <= pr:
                while pl <= pr and arr[pl] <= number:
                    pl += 1
                while pl <= pr and arr[pr] > number:
                    pr -= 1
                if pl < pr:
                    tmp = arr[pl]
                    arr[pl] = arr[pr]
                    arr[pr] = tmp
                    pl += 1
                    pr -= 1
            pl -= 1
            arr[left] = arr[pl]
            arr[pl] = number
            helper(left, pl - 1)
            helper(pl + 1, right)

        helper(0, len(arr) - 1)
        return arr[:k]

arr = [0,0,1,2,4,2,2,3,1,4]
k = 8
result = Solution().getLeastNumbers(arr, k)
print(result)