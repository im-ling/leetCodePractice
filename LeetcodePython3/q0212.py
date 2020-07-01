#!/usr/bin/python3
from typing import List, Dict


class Solution:

    def findWord(self, board: List[List[str]], flagBoard: List[List[bool]], word: str, currentLen: int,
                 x: int, y: int, xMax: int,
                 yMax: int, foundFlag: List[bool]):
        if foundFlag[0]:
            return
        if currentLen < 0:
            foundFlag[0] = True
            return
        if x < 0 or x > xMax or y < 0 or y > yMax or (not flagBoard[y][x]) or word[currentLen] != board[y][x]:
            return
        flagBoard[y][x] = False
        self.findWord(board, flagBoard, word, currentLen - 1, x - 1, y, xMax, yMax, foundFlag)
        self.findWord(board, flagBoard, word, currentLen - 1, x + 1, y, xMax, yMax, foundFlag)
        self.findWord(board, flagBoard, word, currentLen - 1, x, y - 1, xMax, yMax, foundFlag)
        self.findWord(board, flagBoard, word, currentLen - 1, x, y + 1, xMax, yMax, foundFlag)
        flagBoard[y][x] = True

    def findWords(self, board: List[List[str]], words: List[str]) -> List[str]:
        result: List[str] = []
        yMax = len(board)
        if yMax < 1:
            return result
        xMax = len(board[0])
        flagBoard: List[List[bool]] = [[True for i in range(xMax)] for j in range(yMax)]

        letter26String = "abcdefghijklmnopqrstuvwxyz"
        letterDic: Dict[str:List[List]] = dict()
        for char in letter26String:
            letterDic[char] = list()

        for y in range(yMax):
            for x in range(xMax):
                letterDic[board[y][x]].append([x, y])

        foundFlag: List[bool] = [False]
        for word in words:
            foundFlag[0] = False
            for index in letterDic[word[-1]]:
                self.findWord(board, flagBoard, word, len(word) - 1, index[0], index[1], xMax - 1, yMax - 1, foundFlag)
            if foundFlag[0]:
                result.append(word)

        return result


solu = Solution()
board = [["o", "a", "a", "n"], ["e", "t", "a", "e"], ["i", "h", "k", "r"], ["i", "f", "l", "v"]]
words = ["oath", "pea", "eat", "rain"]
result = solu.findWords(board, words)
print(result)