class Solution:
    def arrangeCoins(self, n: int) -> int:
        if n < 2:
            return n
        left: int = 1
        right: int = (n + 1) // 2
        result = left
        while left <= right:
            mid = (left + right) // 2
            if (mid + 1) * mid / 2 <= n:
                result = mid
                left = mid + 1
            else:
                right = mid - 1
        return result
