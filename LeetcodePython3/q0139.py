#!/usr/bin/python3
from typing import List

class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        length = len(s)
        if length == 0:
            return True
        dp = [False for _ in range(length)]
        maxLenOfWord = 0
        dic = {}
        for word in wordDict:
            dic[word] = 1
            if len(word) > maxLenOfWord:
                maxLenOfWord = len(word)
        if maxLenOfWord == 0:
            return False
        countFalse = 0
        for i in range(1, length + 1):
            j = i - 1
            while j >= 0 and j >= i - maxLenOfWord:
                if (j == 0 or dp[j - 1]) and s[j:i] in dic:
                    dp[i - 1] = True
                    countFalse = 0
                    break
                j -= 1
            if not dp[i - 1]:
                countFalse += 1
                if countFalse >= maxLenOfWord:
                    return False
        return dp[length - 1]

solu = Solution()
s = "leetcode"
wordList = ["leet","code"]
result = solu.wordBreak(s, wordList)
print(result)