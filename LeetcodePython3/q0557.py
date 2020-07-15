class Solution:
    def reverseWords(self, s: str) -> str:
        words = s.split(" ")
        for i in range(len(words)):
            words[i] = words[i][::-1]
        return " ".join(words)

    def reverseWords2(self, s: str) -> str:
        result = ""
        for i in range(len(s)):
            if s[i] == " ":
                index = i - 1
                while index >= 0 and s[index] != " ":
                    result += s[index]
                    index -= 1
                result += " "
        index = len(s) - 1
        while index >= 0 and s[index] != " ":
            result += s[index]
            index -= 1
        return result


solu = Solution()
s = "Let's take LeetCode contest"
result = solu.reverseWords(s)
print(result)
