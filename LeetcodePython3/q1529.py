class Solution:
    def minFlips(self, target: str) -> int:
        result = 0
        tempchar = "0"
        for char in target:
            if char != tempchar:
                tempchar = char
                result += 1
        return result