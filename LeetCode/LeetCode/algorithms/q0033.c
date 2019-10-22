//
//  q0033.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0033.h"
#include "../common.h"

//33. Search in Rotated Sorted Array
//Medium
//1720
//259
//
//
//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1
//Accepted
//334,539
//Submissions
//1,034,910

int search(int* nums, int numsSize, int target) {
    int result = -1;
    if (numsSize <= 0) {
        return result;
    }
    int pLeft = 0;
    int pRight= numsSize - 1;
    int pMiddle = (pLeft + pRight) / 2;
    if (nums[pRight] == target) {
        return pRight;
    }
    while (pLeft < pRight) {
        pMiddle = (pLeft + pRight) / 2;
        // on the same side
        if ((nums[pMiddle] >= nums[0]) == (target >= nums[0])) {
            if (nums[pMiddle] == target) {
                return pMiddle;
            }else if (nums[pMiddle] > target){
                pRight = pMiddle;
            }else{
                pLeft = pMiddle + 1;
            }
        }else if (nums[pMiddle] >= nums[0]){
            pLeft = pMiddle + 1;
        }else{
            pRight = pMiddle;
        }
    }
    return result;
}



//deprecated
//int search(int* nums, int numsSize, int target) {
//    if (numsSize <= 0) {
//        return -1;
//    }
//    int pLeft = 0;
//    int pRight = numsSize - 1;
//    if (nums[pLeft] == target) {
//        return pLeft;
//    }
//    if (nums[pRight] == target) {
//        return pRight;
//    }
//    int pMiddle = 0;
//    while (pLeft < pRight) {
//        pMiddle = (pLeft + pRight + 1) / 2;
//        if (nums[pMiddle] == target) {
//            return pMiddle;
//        }
//        if (pMiddle == pLeft || pMiddle == pRight) {
//            return -1;
//        }
//        if (nums[pMiddle] > target){
//            if (nums[pLeft] > target) {
//                if (nums[pMiddle] > nums[pLeft]) {
//                    pLeft = pMiddle;
//                }else{
//                    pRight = pMiddle;
//                }
//            }else{
//                pRight = pMiddle;
//            }
//        }else{
//            if (nums[pRight] < target) {
//                if (nums[pMiddle] < nums[pRight]) {
//                    pRight = pMiddle;
//                }else{
//                    pLeft = pMiddle;
//                }
//            }else{
//                pLeft = pMiddle;
//            }
//        }
//    }
//    return -1;
//}
int question33(){
    int numsSize = 7;
    int nums[7] = {4,5,6,7,0,1,2};
//    srand((int) time(0));
//    int randomNumber = rand() % numsSize;
    for (int i = 0; i < numsSize; i++) {
//        nums[i] = (i + randomNumber) % (numsSize + 1);
        printf(" %d",nums[i]);
    }
    printf("\n searchResult: index(%d)",search(nums, numsSize, 0));
    return 0;
}

