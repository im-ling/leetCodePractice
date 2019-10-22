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
#define  sudokuAvailableNumberSize 10
struct sudokuCell {
    int fillNumber;
    int availableNumber[sudokuAvailableNumberSize];
};
typedef struct sudokuCell *pSudokuCell;

bool fillASudokuCell(char **board, int boardRowSize, int boardColSize, int x, int y, int value, pSudokuCell **sudokuCell){
    sudokuCell[x][y]->fillNumber = value;
    for (int i = 0; i < boardRowSize; i++) {
        if(!sudokuCell[i][y]->availableNumber[value]){
            sudokuCell[i][y]->availableNumber[0]--;
            sudokuCell[i][y]->availableNumber[value] = 1;
        }
        if(!sudokuCell[i][y]->availableNumber[value]){
            sudokuCell[x][i]->availableNumber[0]--;
            sudokuCell[x][i]->availableNumber[value] = 1;
        }
        pSudokuCell p = sudokuCell[x / 3 * 3 + i / 3][y / 3 * 3 + i % 3];
        if(!p->availableNumber[value]){
            p->availableNumber[0]--;
            p->availableNumber[value] = 1;
        }
    }
    return true;
}

void sudokuBruteForce(char** board, int boardRowSize, int boardColSize,pSudokuCell **sudokuCell,int *blankCellArray, int blankCellArrayCount,bool *notFound){
    if (*notFound == false) {
        return;
    }
    if (blankCellArrayCount == 0) {
//        printSudoku(board, boardRowSize, boardColSize);
//        printf("--");
        *notFound = false;
        return;
    }

    int x = *blankCellArray / boardColSize;
    int y = *blankCellArray % boardColSize;
    for (int i = 1; i < sudokuAvailableNumberSize && *notFound; i++) {
        if (sudokuCell[x][y]->availableNumber[i] == 0) {
            board[x][y] = (char)( i + '0' );
            if (isValidSudoku(board, boardRowSize, boardColSize)) {
                sudokuBruteForce(board, boardRowSize, boardColSize, sudokuCell, blankCellArray + 1, blankCellArrayCount - 1, notFound);
            }
            if (*notFound == false) {
                return;
            }
            board[x][y] = '.';
        }
    }
//    printf("\nleft count (%d)",blankCellArrayCount);
}

void solveSudoku(char** board, int boardRowSize, int boardColSize) {
//    struct sudokuCell ***
    pSudokuCell **sudokuTwoDimensionCells = calloc(boardRowSize, sizeof(pSudokuCell *));
    for (int i = 0; i < boardRowSize; i++) {
        sudokuTwoDimensionCells[i] = calloc(boardColSize, sizeof(pSudokuCell));
        for (int j = 0; j < boardColSize; j++) {
            sudokuTwoDimensionCells[i][j] = calloc(1, sizeof(struct sudokuCell));
            sudokuTwoDimensionCells[i][j]->availableNumber[0] = 9;
        }
    }

//    scanSudoku
    for (int i = 0; i < boardRowSize; i++) {
        for (int j = 0; j < boardColSize; j++) {
            if (board[i][j] != '.') {
                fillASudokuCell(board, boardRowSize, boardColSize, i, j, board[i][j] - '0', sudokuTwoDimensionCells);
            }
        }
    }
    
//optimize
    bool flagOptimize = true;
    while (flagOptimize) {
        flagOptimize = false;
        for (int i = 0; i < boardRowSize; i++) {
            for (int j = 0; j < boardColSize; j++) {
                if (sudokuTwoDimensionCells[i][j]->availableNumber[0] == 1 && sudokuTwoDimensionCells[i][j]->fillNumber == 0) {
                    for (int k = 1; k < sudokuAvailableNumberSize; k++) {
                        if (sudokuTwoDimensionCells[i][j]->availableNumber[k] == 0) {
                            flagOptimize = fillASudokuCell(board, boardRowSize, boardColSize, i, j, k , sudokuTwoDimensionCells);
                        }
                    }
                }
            }
        }
    }
    
//  bf solve
    int size = boardColSize * boardRowSize + 1;
    int *blankCell = calloc(size, sizeof(int));
    int countBlankCell = 0;
    for (int i = 0; i < boardRowSize; i++) {
        for (int j = 0; j < boardColSize; j++) {
            if (sudokuTwoDimensionCells[i][j]->fillNumber) {
                if (board[i][j] == '.') {
                    board[i][j] = (char) ('0' + sudokuTwoDimensionCells[i][j]->fillNumber);
                }
            }else{
                blankCell[countBlankCell++] = i * boardColSize + j;
            }
        }
    }
    bool notFoundFlag = true;
    sudokuBruteForce(board, boardRowSize, boardColSize, sudokuTwoDimensionCells, blankCell, countBlankCell, &notFoundFlag);
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
