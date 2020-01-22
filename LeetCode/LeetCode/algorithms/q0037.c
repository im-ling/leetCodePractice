//
//  q0037.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0037.h"
#include "../common.h"
#include "q0036.h"

//37. Sudoku Solver
//Hard
//
//624
//
//42
//
//Favorite
//
//Share
//Write a program to solve a Sudoku puzzle by filling the empty cells.
//
//A sudoku solution must satisfy all of the following rules:
//
//Each of the digits 1-9 must occur exactly once in each row.
//Each of the digits 1-9 must occur exactly once in each column.
//Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
//Empty cells are indicated by the character '.'.
//
//
//A sudoku puzzle...
//
//
//...and its solution numbers marked in red.
//
//Note:
//
//The given board contain only digits 1-9 and the character '.'.
//You may assume that the given Sudoku puzzle will have a single unique solution.
//The given board size is always 9x9.
//Accepted
//110,506
//Submissions
//319,834





//bool q37isValidNumber(char** board, char c, int row, int col){
//    for (int i = 0; i < 9; i++) {
//        if ((board[row][i] == c) || (board[i][col] == c) || board[row / 3 * 3 + i / 3][col / 3 * 3 + i % 3] == c){
//            return false;
//        }
//    }
//    return true;
//}
//bool fillANumber(char **board, int boardRowSize, int boardColSize){
//    for (int row = 0; row < boardRowSize; row++) {
//        for (int col = 0; col < boardColSize; col++) {
//            if (board[row][col] == '.') {
//                for (int c = '1'; c <= '9'; c++) {
//                    if (q37isValidNumber(board, c, row, col)) {
//                        board[row][col] = c;
//                        if(fillANumber(board, boardRowSize, boardColSize))
//                            return true;
//                        board[row][col] = '.';
//                    }
//                }
//                return false;
//            }
//        }
//    }
//    return true;
//}
//void solveSudoku(char** board, int boardRowSize, int boardColSize){
//    fillANumber(board, boardRowSize, boardColSize);
//}




// Original author: Hsien Loong Lee (http://bit.ly/1zfIGMc)
// https://www.facebook.com/leehsienloong/photos/a.344710778924968.83425.125845680811480/905828379479869/?type=3&permPage=1
int InBlock[81], InRow[81], InCol[81];

const int BLANK = 0;
const int ONES = 0x3fe;     // Binary 1111111110

int Entry[81];    // Records entries 1-9 in the grid, as the corresponding bit set to 1
int Block[9], Row[9], Col[9];    // Each int is a 9-bit array

int SeqPtr = 0;
int Sequence[81];



void SwapSeqEntries(int S1, int S2)
{
     int temp = Sequence[S2];
     Sequence[S2] = Sequence[S1];
     Sequence[S1] = temp;
}


void InitEntry(int i, int j, int val)
{
     int Square = 9 * i + j;
     int valbit = 1 << val;
     int SeqPtr2;

     // add suitable checks for data consistency

     Entry[Square] = valbit;
     Block[InBlock[Square]] &= ~valbit;
     Col[InCol[Square]] &= ~valbit; // Simpler Col[j] &= ~valbit;
     Row[InRow[Square]] &= ~valbit; // Simpler Row[i] &= ~valbit;

     SeqPtr2 = SeqPtr;
     while (SeqPtr2 < 81 && Sequence[SeqPtr2] != Square)
           SeqPtr2++ ;

     SwapSeqEntries(SeqPtr, SeqPtr2);
     SeqPtr++;
}


void PrintArray(char **board)
{
     int i, j, valbit, val, Square;
     char ch;

     Square = 0;

     for (i = 0; i < 9; i++) {
         for (j = 0; j < 9; j++) {
             valbit = Entry[Square++];
             if (valbit == 0) ch = '-';
             else {
                 for (val = 1; val <= 9; val++)
                     if (valbit == (1 << val)) {
                        ch = '0' + val;
                        break;
                     }
             }
             board[i][j] = ch;
         }
     }
}


int NextSeq(int S)
{
    int S2, Square, Possibles, BitCount;
    int T, MinBitCount = 100;

    for (T = S; T < 81; T++) {
        Square = Sequence[T];
        Possibles = Block[InBlock[Square]] & Row[InRow[Square]] & Col[InCol[Square]]; // how many vaild number can be fill for this square
        BitCount = 0;
        while (Possibles) {
           Possibles &= ~(Possibles & -Possibles); //(x & –x) returns the least significant ‘1’ bit of x
           BitCount++;
        }

        if (BitCount < MinBitCount) {
           MinBitCount = BitCount;
           S2 = T;
        }
    }

    return S2;
}


void Place(int S, char** board)
{
    if (S >= 81) {
        PrintArray(board);
        return;
    }

    int S2 = NextSeq(S);
    SwapSeqEntries(S, S2);

    int Square = Sequence[S];

    int     BlockIndex = InBlock[Square],
            RowIndex = InRow[Square],
            ColIndex = InCol[Square];

    int     Possibles = Block[BlockIndex] & Row[RowIndex] & Col[ColIndex];
    while (Possibles) {
          int valbit = Possibles & (-Possibles); // Lowest 1 bit in Possibles
          Possibles &= ~valbit;
          Entry[Square] = valbit;
          Block[BlockIndex] &= ~valbit;
          Row[RowIndex] &= ~valbit;
          Col[ColIndex] &= ~valbit;

          Place(S + 1, board);

          Entry[Square] = BLANK; // Could be moved out of the loop
          Block[BlockIndex] |= valbit;
          Row[RowIndex] |= valbit;
          Col[ColIndex] |= valbit;
    }

    SwapSeqEntries(S, S2);
}

void solveSudoku(char **board, int m, int n) {
    SeqPtr = 0;
    int i, j, Square;

    for (i = 0; i < 9; i++)
        for (j = 0; j < 9; j++) {
            Square = 9 * i + j;
            InRow[Square] = i;
            InCol[Square] = j;
            InBlock[Square] = (i / 3) * 3 + ( j / 3);
        }


    for (Square = 0; Square < 81; Square++) {
        Sequence[Square] = Square;
        Entry[Square] = BLANK;
    }

    for (i = 0; i < 9; i++)
        Block[i] = Row[i] = Col[i] = ONES;

    for (int i = 0; i < 9; ++i)
       for (int j = 0; j < 9; ++j) {
           if ('.' != board[i][j])
                InitEntry(i, j, board[i][j] - '0');
       }

    Place(SeqPtr, board);
}



void printSudoku(char **board, int boardRowSize, int boardColSize){
    printf("\n");
    for (int i = 0; i < boardRowSize; i++) {
        printf("\n");
        for (int j = 0; j < boardColSize; j++) {
            printf("%c ",board[i][j]);
        }
    }
    printf("\n");
}

int question37(void){
    int boardRowSize = 9;
    int boardColSize = 9;
    char **board = calloc(boardRowSize, sizeof(char *));
    for (int i = 0; i < boardRowSize; i++) {
        board[i] = calloc(boardColSize, sizeof(char));
    }
    char *str = "[['5','3','.','.','7','.','.','.','.'],['6','.','.','1','9','5','.','.','.'],['.','9','8','.','.','.','.','6','.'],['8','.','.','.','6','.','.','.','3'],['4','.','.','8','.','3','.','.','1'],['7','.','.','.','2','.','.','.','6'],['.','6','.','.','.','.','2','8','.'],['.','.','.','4','1','9','.','.','5'],['.','.','.','.','8','.','.','7','9']]";
//    char *str = "[['.','9','.','.','4','.','.','.','.'],['1','.','.','.','.','.','6','.','.'],['.','.','3','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.','.'],['.','.','.','7','.','.','.','.','.'],['3','.','.','.','5','.','.','.','.'],['.','.','7','.','.','4','.','.','.'],['.','.','.','.','.','.','.','.','.'],['.','.','.','.','7','.','.','.','.']]";
    int count = 0;
    for (char *p = str; *p != '\0'; p++) {
        if (*p != '[' && *p != '\'' && *p != ',' && *p !=']') {
            board[count / boardColSize][count % boardColSize] = *p;
            count++;
        }
    }
    
    printSudoku(board, boardRowSize, boardColSize);
    solveSudoku(board, boardRowSize, boardColSize);
    printSudoku(board, boardRowSize, boardColSize);
    return 0;
}


