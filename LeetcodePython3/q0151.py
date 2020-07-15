class Solution:
    def reverseWords(self, s: str) -> str:
        words = s.split(" ")
        for i in reversed(range(len(words))):
            if len(words[i]) == 0:
                words.pop(i)
        return " ".join(reversed(words))

    def reverseWords2(self, s: str) -> str:
        words = s.split(" ")
        result = ""
        for word in reversed(words):
            if len(word) > 0:
                result = result + " " + word
        return result[1:]


solu = Solution()
s = "  hello world!  "
result = solu.reverseWords(s)
print(result)