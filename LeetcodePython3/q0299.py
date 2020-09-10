#!/usr/bin/python3
from typing import List

class Solution:
    def getHint(self, secret: str, guess: str) -> str:
        length = len(secret)
        dic = {}
        count_bulls = 0
        flags = [True for _ in range(length)]
        for i in range(length):
            char = secret[i]
            if char == guess[i]:
                count_bulls += 1
                flags[i] = False
            elif char not in dic:
                dic[char] = 1
            else:
                dic[char] += 1
        print(dic)
        count_cows = 0
        for i in range(length):
            char = guess[i]
            if flags[i] and char in dic:
                count_cows += 1
                dic[char] -= 1
                if dic[char] == 0:
                    dic.pop(char)
        return str(count_bulls) + "A" + str(count_cows) + "B"

secret = "1122"
guess = "1222"
result = Solution().getHint(secret, guess)
print(result)

