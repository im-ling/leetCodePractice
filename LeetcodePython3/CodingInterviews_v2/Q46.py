
class Solution:
    def translateNum(self, num: int) -> int:
        if num < 10:
            return 1
        array = []
        while num > 0:
            array.append(num % 10)
            num //= 10
        array.append(0)
        array = array[::-1]
        # print(array)
        length = len(array)
        dp = [0 for _ in range(length)]
        dp[0] = 1
        dp[1] = 1
        for i in range(2, length):
            dp[i] = dp[i - 1]
            if array[i - 1] == 1 or (array[i] < 6 and array[i - 1] == 2):
                dp[i] += dp[i - 2]
        return dp[length - 1]
