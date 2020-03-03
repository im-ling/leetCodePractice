#!/usr/bin/python3
from typing import List


class Solution:

    def findSubstring(self, s: str, words: List[str]) -> List[int]:
        result = []
        dic = {}
        if len(words) < 1:
            return result
        words_len = len(words[0])
        for i in words:
            if i in dic.keys():
                dic[i] += 1
            else:
                dic[i] = 1

        for i in range(len(s) - words_len * len(words) + 1):
            temp_dic = dic.copy()
            j = i
            word = s[j:j + words_len]
            while word in temp_dic.keys():
                if temp_dic[word] == 1:
                    del temp_dic[word]
                else:
                    temp_dic[word] -= 1
                j += words_len
                word = s[j:j + words_len]
            if len(temp_dic) == 0:
                result.append(i)
        return result


solu = Solution()
s = "wordgoodgoodgoodbestword"
words = ["word","good","best","good"]
# s = "wordgoodgoodgoodbestword"
# words = ["word","good","best","word"]
# s = "barfoothefoobarman"
# words = ["foo", "bar"]
result = solu.findSubstring(s, words)
print(result)
