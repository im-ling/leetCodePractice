#!/usr/bin/python3
from typing import List
class Solution:
    def tictactoe(self, moves: List[List[int]]) -> str:
        A = [0] * 8
        B = [0] * 8
        for i in range(len(moves)):
            r, c = moves[i]
            player = A if i % 2 == 0 else B
            player[r] += 1
            player[c + 3] += 1
            if r == c:
                player[6] += 1
            if r == 2 - c:
                player[7] += 1
        for i in range(8):
            if A[i] == 3:
                return "A"
            if B[i] == 3:
                return "B"
        if len(moves) == 9:
            return "Draw"
        else:
            return "Pending"

    def tictactoe2(self, moves: List[List[int]]) -> str:
        aCol = [0, 0, 0]
        aRow = [0, 0, 0]
        aD1 = 0
        aD2 = 0
        bCol = [0, 0, 0]
        bRow = [0, 0, 0]
        bD1 = 0
        bD2 = 0
        for i in range(len(moves)):
            if i % 2 == 0:
                aCol[moves[i][1]] += 1
                aRow[moves[i][0]] += 1
                if moves[i][0] == moves[i][1]:
                    aD1 += 1
                if moves[i][0] + moves[i][1] == 2:
                    aD2 += 1
                if aCol[moves[i][1]] == 3 or aRow[moves[i][0]] == 3 or aD1 == 3 or aD2 == 3:
                    return "A"
            else:
                bCol[moves[i][1]] += 1
                bRow[moves[i][0]] += 1
                if moves[i][0] == moves[i][1]:
                    bD1 += 1
                if moves[i][0] + moves[i][1] == 2:
                    bD2 += 1
                if bCol[moves[i][1]] == 3 or bRow[moves[i][0]] == 3 or bD1 == 3 or bD2 == 3:
                    return "B"
        if len(moves) == 9:
            return "Draw"
        else:
            return "Pending"

solu = Solution()
moves = [[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]]
print("result: "+ solu.tictactoe(moves))
