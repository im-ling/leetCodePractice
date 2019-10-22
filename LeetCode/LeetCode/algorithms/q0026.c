//
//  q0026.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0026.h"
#include "../common.h"

//26. Remove Duplicates from Sorted Array
//Easy
//1213
//2526
//
//
//Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//Example 1:
//
//Given nums = [1,1,2],
//
//Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
//
//It doesn't matter what you leave beyond the returned length.
//Example 2:
//
//Given nums = [0,0,1,1,1,2,2,3,3,4],
//
//Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.
//
//It doesn't matter what values are set beyond the returned length.
//Clarification:
//
//Confused why the returned value is an integer but your answer is an array?
//
//Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.
//
//Internally you can think of this:
//
//// nums is passed in by reference. (i.e., without making a copy)
//int len = removeDuplicates(nums);
//
//// any modification to nums in your function would be known by the caller.
//// using the length returned by your function, it prints the first len elements.
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}
int removeDuplicates(int* nums, int numsSize) {
    if (numsSize <= 1) {
        return numsSize;
    }
    int *p = nums;
    int *pNext = nums+1;
    for (int i = 0; i < numsSize - 1; i++) {
        if (*pNext == *p) {
            pNext++;
        }else{
            p++;
            *p = *pNext;
            pNext++;
        }
    }
    return (int)(p - nums + 1);
}
int question26(){
    int count = 15;
    int array[count];
    for (int i = 0, k = 0; k < count; i++) {
        for (int j = 5 - i; j > 0; j--) {
            array[k++] = i + 1;
//            array[k++] = 0;
        }
    }
    for (int i = 0; i < count; i++) {
        printf(" %d ", array[i]);
    }
//    struct ListNode *nums = intArrayToList(array, count);
//    printList(nums);
    int resultLen = removeDuplicates(array, count);
    printf("\nresult:\n");
    for (int i = 0; i < resultLen; i++) {
        printf(" %d ", array[i]);
    }
    return 0;
}
