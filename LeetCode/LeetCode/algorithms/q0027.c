//
//  q0027.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0027.h"
#include "../common.h"

//27. Remove Element
//Easy
//638
//1377
//
//
//Given an array nums and a value val, remove all instances of that value in-place and return the new length.
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//The order of elements can be changed. It doesn't matter what you leave beyond the new length.
//
//Example 1:
//
//Given nums = [3,2,2,3], val = 3,
//
//Your function should return length = 2, with the first two elements of nums being 2.
//
//It doesn't matter what you leave beyond the returned length.
//Example 2:
//
//Given nums = [0,1,2,2,3,0,4,2], val = 2,
//
//Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.
//
//Note that the order of those five elements can be arbitrary.
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
//int len = removeElement(nums, val);
//
//// any modification to nums in your function would be known by the caller.
//// using the length returned by your function, it prints the first len elements.
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}
int removeElement(int* nums, int numsSize, int val) {
    int count = 0;
    for (int *pLeft = nums,*pRight = nums + numsSize - 1; pLeft <= pRight; pLeft++) {
        if (*pLeft != val) {
            count++;
        }else{
            while (*pRight == val && pRight > pLeft) {
                pRight--;
            }
            if (pRight > pLeft) {
                *pLeft = *pRight;
                pRight--;
                count++;
            }
        }
    }
    return count;
}
int question27(){
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
    int resultLen = removeElement(array, count, 3);
    printf("\nresult:\n");
    for (int i = 0; i < resultLen; i++) {
        printf(" %d ", array[i]);
    }
    return 0;
}
