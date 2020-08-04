#!/usr/bin/python3
from math import sqrt
from typing import List

primesDic = {}
primes = list()
helperDic = {}

class Solution:
    def sumFourDivisors(self, nums: List[int]) -> int:
        if len(primes) == 0:
            legnth = 50000
            bools = [True for _ in range(legnth)];
            for i in range(2, legnth):
                if bools[i]:
                    primes.append(i)
                    primesDic[i] = 1
                    helperDic[i * i * i] = i
                    j = i + i
                    while j < legnth:
                        bools[j] = False
                        j += i
        result = 0
        for num in nums:
            if num in primesDic:
                continue
            if num in helperDic:
                result += num + 1 + helperDic[num] + (num // helperDic[num])
                continue

            for key in primes:
                if key >= sqrt(num):
                    break
                if num % key == 0 and (num // key) in primesDic:
                    result += num + 1 + key + num // key
                    break
        return result


nums = [1,2,3,4,5,6,7,8,9,10]
solu = Solution()
result = solu.sumFourDivisors(nums)
print(result)