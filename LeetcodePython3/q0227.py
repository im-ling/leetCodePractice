class Solution:
    def calculate(self, s: str) -> int:
        num1 = 0
        num2 = 0

        s = "+" + s.replace(" ","") + " "
        length = len(s) - 1
        i = 0

        while i < length:
            char = s[i]
            if char == "+" or char == "-":
                num1 += num2

                tmp = 0
                i += 1
                while ord("0") <= ord(s[i]) <= ord("9"):
                    tmp = tmp * 10 + ord(s[i]) -48
                    i += 1
                i -= 1

                if char == "-":
                    num2 = -tmp
                else:
                    num2 = tmp

            elif char == "*" or char == "/":
                tmp = 0
                i += 1
                while ord("0") <= ord(s[i]) <= ord("9"):
                    tmp = tmp * 10 + ord(s[i]) - 48
                    i += 1
                i -= 1

                if char == "*":
                    num2 *= tmp
                else:
                    num2 = int(num2 / tmp)
            i += 1
            # print(char, num1, num2)

        return num1 + num2


s = "3+2*2"
result = Solution().calculate(s)
print(result)