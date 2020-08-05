from typing import Dict


class WordDictionary:

    dic = {}

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.dic = {}

    def addWord(self, word: str) -> None:
        """
        Adds a word into the data structure.
        """
        temp = self.dic
        for char in word:
            if char not in temp:
                temp[char] = {}
            temp = temp[char]
        temp["End"] = True

    def searchInSubDic(self, word:str, index:int, dic:Dict):
        temp = dic
        wordLen = len(word)
        for i in range(index,wordLen):
            char = word[i]
            if char == ".":
                for key in temp.keys():
                    if key != "End" and self.searchInSubDic(word, i + 1, temp[key]):
                        return True
                return False
            elif char not in temp:
                return False
            temp = temp[char]
        if "End" in temp:
            return True
        else:
            return False


    def search(self, word: str) -> bool:
        """
        Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
        """
        return self.searchInSubDic(word, 0, self.dic)





obj = WordDictionary()
obj.addWord("a")
obj.addWord("a")
print(obj.search("."))
print(obj.search("a"))
print(obj.search("aa"))
print(obj.search("a"))
print(obj.search(".a"))
print(obj.search("a."))
# obj.addWord("bad")
# obj.addWord("dad")
# obj.addWord("mad")
# print(obj.search("pad"))
# print(obj.search("bad"))
# print(obj.search(".ad"))
# print(obj.search("b.."))
