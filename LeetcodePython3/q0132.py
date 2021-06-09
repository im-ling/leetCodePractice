class Solution:
    def minCut(self, s: str) -> int:
        length = len(s)
        dp1 = [[False for _ in range(length + 1)] for _ in range(length + 1)]
        for i in range(length + 1):
            dp1[i][i] = True
        for i in reversed(range(1, length)):
            for j in range(i + 1, length + 1):
                if s[i - 1] == s[j - 1] and (j - i == 1 or dp1[i + 1][j - 1]):
                    dp1[i][j] = True
        # for line in dp1:
        #     print(line)
        dp2 = [length for _ in range(length + 1)]
        for i in range(1, length + 1):
            if dp1[1][i]:
                dp2[i] = 0
            else:
                for j in reversed(range(1, i + 1)):
                    if dp1[j][i]:
                        dp2[i] = min(dp2[j - 1] + 1, dp2[i])
            # print(dp2)
        return dp2[length]

s = "abbab"
result = Solution().minCut(s)
print(result)