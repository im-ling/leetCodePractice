//
//  q0036.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0036.h"

//36. Valid Sudoku
//Medium
//
//639
//
//213
//
//Favorite
//
//Share
//Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
//
//Each row must contain the digits 1-9 without repetition.
//Each column must contain the digits 1-9 without repetition.
//Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
//
//A partially filled sudoku which is valid.
//
//The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
//
//Example 1:
//
//Input:
//[
// ["5","3",".",".","7",".",".",".","."],
// ["6",".",".","1","9","5",".",".","."],
// [".","9","8",".",".",".",".","6","."],
// ["8",".",".",".","6",".",".",".","3"],
// ["4",".",".","8",".","3",".",".","1"],
// ["7",".",".",".","2",".",".",".","6"],
// [".","6",".",".",".",".","2","8","."],
// [".",".",".","4","1","9",".",".","5"],
// [".",".",".",".","8",".",".","7","9"]
// ]
//Output: true
//Example 2:
//
//Input:
//[
// ["8","3",".",".","7",".",".",".","."],
// ["6",".",".","1","9","5",".",".","."],
// [".","9","8",".",".",".",".","6","."],
// ["8",".",".",".","6",".",".",".","3"],
// ["4",".",".","8",".","3",".",".","1"],
// ["7",".",".",".","2",".",".",".","6"],
// [".","6",".",".",".",".","2","8","."],
// [".",".",".","4","1","9",".",".","5"],
// [".",".",".",".","8",".",".","7","9"]
// ]
//Output: false
//Explanation: Same as Example 1, except with the 5 in the top left corner being
//modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
//Note:
//
//A Sudoku board (partially filled) could be valid but is not necessarily solvable.
//Only the filled cells need to be validated according to the mentioned rules.
//The given board contain only digits 1-9 and the character '.'.
//The given board size is always 9x9.
//Accepted
//196,760
//Submissions
//484,486


bool checkOneNumber(char** board, char c, int row, int col){
    board[row][col] = '.';
    for (int i = 0; i < 9; i++) {
        if ((board[row][i] == c) || (board[i][col] == c) || board[row / 3 * 3 + i / 3][col / 3 * 3 + i % 3] == c){
            board[row][col] = c;
            return false;
        }
    }
    board[row][col] = 'c';
    return true;
}

bool isValidSudoku(char** board, int boardRowSize, int boardColSize) {
    for (int i = 0; i < boardRowSize; i++) {
        for (int j = 0; j < boardColSize; j++) {
            if (board[i][j] != '.' && !checkOneNumber(board, board[i][j], i, j)) {
                return false;
            }
        }
    }
    return true;
}

//bool fillABlank(bool *blanks,char element){
//    if (element == '.') {
//    }else if (blanks[element] == true){
//        return false;
//    }else{
//        blanks[element] = true;
//    }
//    return true;
//}
//#define Q36BlankSize 128
//bool isValidSudoku(char** board, int boardRowSize, int boardColSize) {
//    int result = true;
//    int blankSize = 128;
//    static bool *blank[Q36BlankSize];
//    static bool *blank2[Q36BlankSize];
//    static bool *blank3[Q36BlankSize];
//    memset(blank, false, blankSize * sizeof(bool));
//    memset(blank2, false, blankSize * sizeof(bool));
//    memset(blank3, false, blankSize * sizeof(bool));
//    for (int i = 0; i < boardRowSize; i++) {
//        for (int j = 0; j < boardColSize; j++) {
//            result = (fillABlank((bool *)blank, board[i][j]) && fillABlank((bool *)blank2, board[j][i]) && fillABlank((bool *)blank3, board[(i / 3) * 3 + j / 3][(i % 3) * 3 + j % 3]));
//            if (!result) {
//                return result;
//            }
//        }
//    }
//    return result;
//}
int question36(void){
    int boardRowSize = 9;
    int boardColSize = 9;
    char **board = calloc(boardRowSize, sizeof(char *));
    for (int i = 0; i < boardRowSize; i++) {
        board[i] = calloc(boardColSize, sizeof(char));
    }
    
    char *str = "[['5','3','.','.','7','.','.','.','.'],['6','.','.','1','9','5','.','.','.'],['.','9','8','.','.','.','.','6','.'],['8','.','.','.','6','.','.','.','3'],['4','.','.','8','.','3','.','.','1'],['7','.','.','.','2','.','.','.','6'],['.','6','.','.','.','.','2','8','.'],['.','.','.','4','1','9','.','.','5'],['.','.','.','.','8','.','.','7','9']]";
//    "[['.','9','.','.','4','.','.','.','.'],['1','.','.','.','.','.','6','.','.'],['.','.','3','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.','.'],['.','.','.','7','.','.','.','.','.'],['3','.','.','.','5','.','.','.','.'],['.','.','7','.','.','4','.','.','.'],['.','.','.','.','.','.','.','.','.'],['.','.','.','.','7','.','.','.','.']]";
    int count = 0;
    for (char *p = str; *p != '\0'; p++) {
        if (*p != '[' && *p != '\'' && *p != ',' && *p !=']') {
            board[count / boardColSize][count % boardColSize] = *p;
            count++;
        }
    }
    bool result = isValidSudoku(board, boardRowSize, boardColSize);
    printf("\nthe result: %d\n",result);
    return 0;
}
