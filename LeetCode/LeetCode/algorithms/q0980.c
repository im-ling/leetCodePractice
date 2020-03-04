//
//  q0980.c
//  LeetCode
//
//  Created by NowOrNever on 14/02/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0980.h"
#include "../common.h"

//980. Unique Paths III
//Hard
//
//388
//
//49
//
//Add to List
//
//Share
//On a 2-dimensional grid, there are 4 types of squares:
//
//1 represents the starting square.  There is exactly one starting square.
//2 represents the ending square.  There is exactly one ending square.
//0 represents empty squares we can walk over.
//-1 represents obstacles that we cannot walk over.
//Return the number of 4-directional walks from the starting square to the ending square, that walk over every non-obstacle square exactly once.
//
//
//
//Example 1:
//
//Input: [[1,0,0,0],[0,0,0,0],[0,0,2,-1]]
//Output: 2
//Explanation: We have the following two paths:
//1. (0,0),(0,1),(0,2),(0,3),(1,3),(1,2),(1,1),(1,0),(2,0),(2,1),(2,2)
//2. (0,0),(1,0),(2,0),(2,1),(1,1),(0,1),(0,2),(0,3),(1,3),(1,2),(2,2)
//Example 2:
//
//Input: [[1,0,0,0],[0,0,0,0],[0,0,0,2]]
//Output: 4
//Explanation: We have the following four paths:
//1. (0,0),(0,1),(0,2),(0,3),(1,3),(1,2),(1,1),(1,0),(2,0),(2,1),(2,2),(2,3)
//2. (0,0),(0,1),(1,1),(1,0),(2,0),(2,1),(2,2),(1,2),(0,2),(0,3),(1,3),(2,3)
//3. (0,0),(1,0),(2,0),(2,1),(2,2),(1,2),(1,1),(0,1),(0,2),(0,3),(1,3),(2,3)
//4. (0,0),(1,0),(2,0),(2,1),(1,1),(0,1),(0,2),(0,3),(1,3),(1,2),(2,2),(2,3)
//Example 3:
//
//Input: [[0,1],[2,0]]
//Output: 0
//Explanation:
//There is no path that walks over every empty square exactly once.
//Note that the starting and ending square can be anywhere in the grid.
//
//
//Note:
//
//1 <= grid.length * grid[0].length <= 20
//Accepted
//23,670
//Submissions
//32,714

void visit(int** grid, int gridSize, int* gridColSize, int row, int col, int *result, int count){
    if (row < 0 || col < 0 || row >= gridSize || col >= *gridColSize || grid[row][col] == -1) {
        return;
    }else if (grid[row][col] == 2){
        if (!count) {
            (*result)++;
        }
        return;
    }else{
        grid[row][col] = -1;
        visit(grid, gridSize, gridColSize, row - 1, col, result, count - 1);
        visit(grid, gridSize, gridColSize, row , col - 1, result, count - 1);
        visit(grid, gridSize, gridColSize, row + 1, col, result, count - 1);
        visit(grid, gridSize, gridColSize, row , col + 1, result, count - 1);
        grid[row][col] = 0;
    }
}


int uniquePathsIII(int** grid, int gridSize, int* gridColSize){
    int row_start = 0;
    int col_start = 0;
    int row_end = 0;
    int col_end = 0;
    int count = 0;
    for (int i = 0; i < gridSize; i++) {
        for (int j = 0; j < *gridColSize; j++) {
            if (!grid[i][j]) {
                count++;
            }else if (grid[i][j] == 1) {
                row_start = i;
                col_start = j;
            }else if (grid[i][j] == 2) {
                row_end = i;
                col_end = j;
            }
        }
    }
    int result = 0;
    grid[row_start][col_start] = -1;
    visit(grid, gridSize, gridColSize, row_start - 1, col_start, &result, count);
    visit(grid, gridSize, gridColSize, row_start , col_start - 1, &result, count);
    visit(grid, gridSize, gridColSize, row_start + 1, col_start, &result, count);
    visit(grid, gridSize, gridColSize, row_start , col_start + 1, &result, count);
    grid[row_start][col_start] = 1;
    return result;
}


int question980(){
//    [[],[0,0,0,0],[0,0,2,-1]]
    int row = 3;
    int col = 4;
    int col1[] = {1,0,0,0};
    int col2[] = {0,0,0,0};
    int col3[] = {0,0,2,-1};
    int **grid = malloc(sizeof(int *) * row);
    grid[0] = col1;
    grid[1] = col2;
    grid[2] = col3;
    int result = uniquePathsIII(grid, row, &col);
    printf("\nresult: %d\n",result);
    return 0;
}
