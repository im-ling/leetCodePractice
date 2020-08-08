class Solution:
    def longestAwesome(self, s: str) -> int:
        result = 1
        len_s = len(s)
        dic = {0:-1}
        number = 0
        for i in range(len_s):
            char = s[i]
            number ^= 1 << int(char)
            if number not in dic:
                dic[number] = i
            # 如果发现两个一样的key，则i - dic[number]期间的数全部重复，全部重复，可以再随意加一个数
            elif i - dic[number] + 1 > result:
                result = i - dic[number] + 1
            for j in range(10):
                if int(char) == j:
                    continue
                # 如果只差一个数，将这个数异或掉
                temp = (1 << j) ^ number
                if temp in dic and result < i - dic[temp]:
                    result = i - dic[temp]
        # i - dic[number] + 1 可以大于 len_s
        if result > len_s:
            result = len_s
        return result

s = "78133156"
result = Solution().longestAwesome(s)
print(result)