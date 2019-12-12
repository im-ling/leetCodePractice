class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        dic = {'{': '}', '[': ']', '(': ')'}
        for i in s:
            if i in dic.keys():
                stack.append(dic[i])
            elif len(stack) <= 0 or stack.pop() != i:
                return False
        if len(stack) == 0:
            return True
        else:
            return False

    def isValid2(self, s: str) -> bool:
        stack = []
        for i in s:
            if i == '{' or i == '(' or i == '[':
                stack.append(i)
            elif len(stack) <= 0:
                return False
            else:
                pre = stack.pop()
                if not (ord(i) == ord(pre) + 1 or ord(i) == ord(pre) + 2):
                    return False
        if len(stack) == 0:
            return True
        else:
            return False

solu = Solution()
print(solu.isValid("{"))
