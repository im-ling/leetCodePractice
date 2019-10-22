//
//  q0080.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0080.h"
#include "../common.h"

//80. Remove Duplicates from Sorted Array II
//Medium
//728
//567
//Favorite
//Share
//Given a sorted array nums, remove the duplicates in-place such that duplicates appeared at most twice and return the new length.
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//Example 1:
//Given nums = [1,1,1,2,2,3],
//Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
//It doesn't matter what you leave beyond the returned length.
//
//Example 2:
//Given nums = [0,0,1,1,1,1,2,3,3],
//Your function should return length = 7, with the first seven elements of nums being modified to 0, 0, 1, 1, 2, 3 and 3 respectively.
//It doesn't matter what values are set beyond the returned length.
//
//Clarification:
//Confused why the returned value is an integer but your answer is an array?
//Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.
//
//Internally you can think of this:
//// nums is passed in by reference. (i.e., without making a copy)
//int len = removeDuplicates(nums);
//
//// any modification to nums in your function would be known by the caller.
//// using the length returned by your function, it prints the first len elements.
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}
//Accepted
//213,260
//Submissions
//520,158

int q80RemoveDuplicates(int* nums, int numsSize){
    if (numsSize <= 2) {
        return numsSize;
    }
    int size = 0;
    for (int i = 2; i < numsSize; i++) {
        if (nums[i] > nums[size]) {
            nums[++size + 1] = nums[i];
        }
    }
    return size + 2;
}

int question80(){
    int randomSize = 10;
    int maxValue = 5;
    int nums[randomSize];
    for (int i = 0; i < randomSize; i++) {
        nums[i] = arc4random() % maxValue;
        printf(" %d",nums[i]);
    }
    printf("\n");
    qsort(nums, randomSize, sizeof(int), compareIntFunction);
//    sortColors(nums, randomSize);
    for (int i = 0; i < randomSize; i++) {
        printf(" %d",nums[i]);
    }
    printf("\n");
    int returnNum = q80RemoveDuplicates(nums, randomSize);
    for (int i = 0; i < returnNum; i++) {
        printf(" %d",nums[i]);
    }
    printf("\n");

    return 0;
}
