class Solution:
    def toGoatLatin(self, S: str) -> str:
        result = ""
        words = S.split(" ")
        if len(words) < 1:
            return result
        vowelSet = {"A", "E", "I", "O", "U", "a", "e", "i", "o", "u"}
        suffix = ""
        index = 0
        for word in words:
            index += 1
            suffix += "a"
            newWord = ""
            if word[0] in vowelSet:
                newWord = word
            else:
                newWord = word[1:] + word[0]
            newWord += "ma"
            result += newWord + suffix + " "
        return result[:-1]


S = "I speak Goat Latin"
result = Solution().toGoatLatin(S)
print(result)