#!/usr/bin/python3
from typing import List


class Solution:
    def numberToWords(self, num: int) -> str:
        if num == 0:
            return "Zero"
        ones_map = {1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine",
                    10: "Ten",
                    11: "Eleven", 12: "Twelve", 13: "Thirteen", 14: "Fourteen", 15: "Fifteen", 16: "Sixteen",
                    17: "Seventeen",
                    18: "Eighteen", 19: "Nineteen"}
        tens_map = {1: "Ten", 2: "Twenty", 3: "Thirty", 4: "Forty", 5: "Fifty", 6: "Sixty", 7: "Seventy", 8: "Eighty",
                    9: "Ninety"}

        def count(_number: int, result: str) -> str:
            if _number >= 100:
                result += " " + ones_map[_number // 100] + " Hundred"
                _number = _number % 100
            if 0 < _number < 20:
                result += " " + ones_map[_number]
            else:
                tens = _number // 10
                if tens in tens_map:
                    result += " " + tens_map[tens]
                ones = _number % 10
                if ones in ones_map:
                    result += " " + ones_map[ones]
            return result

        result = ""
        base = pow(10, 9)
        thousands = ["", " Thousand", " Million", " Billion"]
        i = 3
        while i >= 0:
            if num >= base:
                result = count(num // base, result) + thousands[i]
                num %= base
            base //= 1000
            i -= 1
        return result[1:]


num = 12345
result = Solution().numberToWords(num)
print(result)