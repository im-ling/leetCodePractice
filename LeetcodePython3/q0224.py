class Solution:
    def calculate(self, s: str) -> int:
        s = s + " "
        number_stack = [0]
        flag_stack = [1]
        index = 0

        length = len(s)
        i = 0

        while i < length:
            char = s[i]
            if char == " " or char == "+":
                pass
            elif char == "-":
                flag_stack[index] = -flag_stack[index]
            elif 48 <= ord(char) <= 57:
                number = 0
                # 48 ord("0"), 57 ord("9")
                while 48 <= ord(s[i]) <= 57:
                    number = number * 10 + ord(s[i]) - 48
                    i += 1
                number_stack[index] += flag_stack[index] * number
                flag_stack[index] = 1
                i -= 1
            elif char == "(":
                index += 1
                if index < len(number_stack):
                    number_stack[index] = 0
                    flag_stack[index] = 1
                else:
                    number_stack.append(0)
                    flag_stack.append(1)
            # char == ")"
            else:
                index -= 1
                number_stack[index] += number_stack[index + 1] * flag_stack[index]
                flag_stack[index] = 1
            i += 1
            # print(char)
            # print(number_stack)
            # print(flag_stack)
        # print(number_stack)
        return number_stack[0]

s = "(7)-(0)+(4)"
result = Solution().calculate(s)
print(result)
