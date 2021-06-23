#!/usr/bin/python3
from typing import List

class Solution:
    def addOperators(self, num: str, target: int) -> List[str]:
        result = []
        def helper(path, left, right, res, last):
            if left == right:
                if res == target:
                    result.append(path)
                return
            else:
                for i in range(left, right):
                    if i != left and num[left] == "0":
                        break
                    cur = int(num[left:i + 1])
                    if left == 0:
                        helper(path + str(cur), i + 1, right, cur, cur)
                    else:
                        helper(path + "+" + str(cur), i + 1, right, res + cur, cur)
                        helper(path + "-" + str(cur), i + 1, right, res - cur, -cur)
                        helper(path + "*" + str(cur), i + 1, right, res - last + last * cur, last * cur)
        helper("", 0, len(num), 0, 0)
        return result

nums = "00"
target = 0
result = Solution().addOperators(nums, target)
print(result)