#!/usr/bin/python3
from typing import List, Counter


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> List[str]:
        sLength = len(s)
        if sLength == 0:
            return [""];
        if set(Counter(s).keys()) > set(Counter("".join(wordDict)).keys()):
            return []
        dic = {}
        wordMaxLen = 0
        for word in wordDict:
            dic[word] = 1
            wordLen = len(word)
            if wordMaxLen < wordLen:
                wordMaxLen = wordLen
        if wordMaxLen == 0:
            return []
        dp = [list() for _ in range(wordMaxLen)]
        count = 0
        for i in range(sLength):
            array = list()
            j = i
            while j >= 0 and j >= i - wordMaxLen + 1:
                if s[j:i + 1] in dic:
                    count = 0
                    if j == 0:
                        array.append(s[j:i + 1])
                    elif len(dp[(j - 1) % wordMaxLen]) > 0:
                        for item in dp[(j - 1) % wordMaxLen]:
                            array.append(item + " " + s[j: i + 1])
                j -= 1
            dp[i % wordMaxLen] = array
            count += 1
            if count > wordMaxLen:
                return []
        return dp[(sLength - 1) % wordMaxLen]


solu = Solution()
s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
wordList = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
result = solu.wordBreak(s, wordList)
print(result)