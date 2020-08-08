class Solution:
    def minInsertions(self, s: str) -> int:
        result = 0
        sum = 0
        for char in s:
            if char == ")":
                sum -= 1
            if char == "(":
                if sum < 0:
                    result += abs(sum) // 2
                    result += (abs(sum) % 2) * 2
                    sum = 0
                elif sum % 2 != 0:
                    result += 1
                    sum -= 1
                sum += 2
        if sum < 0:
            result += abs(sum) // 2
            result += (abs(sum) % 2) * 2
        else:
            result += sum
        return result

s = "(()))(()))()())))"
result = Solution().minInsertions(s)
print(result)