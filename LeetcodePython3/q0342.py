class Solution:
    def isPowerOfFour(self, num: int) -> bool:
        return num > 0 and 0x1000000000000000 % num == 0 and 0x1555555555555555 & num > 0