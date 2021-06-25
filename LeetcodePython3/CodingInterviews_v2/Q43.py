class Solution:
    def countDigitOne(self, n: int) -> int:
        base = 10
        power = 1
        while base <= n:
            base *= 10
            power += 1
        base //= 10
        power -= 1

        result = 0
        while n >= 10:
            high = n // base
            if high == 0:
                pass
            else:
                result += high * base // 10 * power
                if high == 1:
                    result += n % base + 1
                else:
                    result += base
            n = n % base
            base //= 10
            power -= 1
        if n > 0:
            result += 1
        return result