class Solution:
    def canConvertString(self, s: str, t: str, k: int) -> bool:
        s_len = len(s)
        t_len = len(t)
        if s_len != t_len:
            return False
        dic = {}
        maxVal = 0
        for i in range(s_len):
            diff = (ord(t[i]) - ord(s[i]) + 26) % 26
            if diff not in dic:
                dic[diff] = 0
            dic[diff] += 1
            if maxVal < dic[diff]:
                maxVal = dic[diff]
        if 0 in dic:
            del dic[0]

        if k >= maxVal * 26 or len(dic.keys()) == 0:
            return True

        print(dic)
        for i in range(1, k + 1):
            index = i % 26
            if index in dic:
                dic[index] -= 1
                if dic[index] == 0:
                    del dic[index]
                    if len(dic.keys()) == 0:
                        return True
        return False

s = "input"
t = "ouput"
k = 9
solu = Solution()
result = solu.canConvertString(s, t, k)
print(result)
