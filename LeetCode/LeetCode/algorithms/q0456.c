//
//  q0456.c
//  LeetCode
//
//  Created by NowOrNever on 15/02/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0456.h"
#include "../common.h"
//456. 132 Pattern
//Medium
//
//1029
//
//70
//
//Add to List
//
//Share
//Given a sequence of n integers a1, a2, ..., an, a 132 pattern is a subsequence ai, aj, ak such that i < j < k and ai < ak < aj. Design an algorithm that takes a list of n numbers as input and checks whether there is a 132 pattern in the list.
//
//Note: n will be less than 15,000.
//
//Example 1:
//Input: [1, 2, 3, 4]
//
//Output: False
//
//Explanation: There is no 132 pattern in the sequence.
//Example 2:
//Input: [3, 1, 4, 2]
//
//Output: True
//
//Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
//Example 3:
//Input: [-1, 3, 2, 0]
//
//Output: True
//
//Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].
bool find132pattern(int* nums, int numsSize){
    if (numsSize < 3) {
        return false;
    }
        
    int stack[numsSize];
    int stackLen = 0;
    int mid = INT_MIN;
    
    for ( int i = numsSize - 1; i >= 0; i-- ) {

        //printf( "%d %d %d\n", nums[i], mid, stackLen ? stack[stackLen-1] : 0 );
        if ( nums[i] < mid )
            return true;
        
        while( ( stackLen > 0 ) && ( nums[i] > stack[stackLen-1] ) ){
            mid = stack[--stackLen];
        }
        
        stack[stackLen++] = nums[i];
    }
    return false;
}

int question456(){
    int nums[] = {3,5,0,3,4};
    bool result = find132pattern(nums, sizeof(nums) / sizeof(int));
    printf("question456: %d\n", result);
    return 0;
}
