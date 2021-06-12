#!/usr/bin/python3
from typing import List


class Solution:
    def fractionToDecimal(self, numerator: int, denominator: int) -> str:
        if numerator % denominator == 0:
            return str(numerator // denominator)
        minus_flag = (numerator * denominator < 0)
        numerator = abs(numerator)
        denominator = abs(denominator)
        result = str(numerator // denominator) + "."
        remainder_map = {}
        length = len(result) - 1
        remainder = numerator % denominator * 10
        can_devided = False
        while remainder not in remainder_map:
            result += str(remainder // denominator)
            length += 1
            remainder_map[remainder] = length
            remainder = remainder % denominator * 10
            if remainder == 0:
                can_devided = True
                break
        if not can_devided:
            index = remainder_map[remainder]
            result = result[0:index] + "(" + result[index:] + ")"
        if minus_flag:
            result = "-" + result
        return result


numerator = 2147483647
denominator = 37
result = Solution().fractionToDecimal(numerator, denominator)
print(result)

