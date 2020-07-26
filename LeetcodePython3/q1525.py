class Solution:
    def numSplits(self, s: str) -> int:
        result = 0
        allDic = {}
        for char in s:
            if char not in allDic:
                allDic[char] = 0
            allDic[char] += 1

        newDic = {}
        for char in s:
            if char not in newDic:
                newDic[char] = 0
            newDic[char] += 1
            allDic[char] -= 1
            if allDic[char] == 0:
                del allDic[char]
            if len(allDic.keys()) == len(newDic.keys()):
                result += 1
        return result

solu = Solution()
s = "aacaba"
result = solu.numSplits(s)
print(result)


