//
//  q0075.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0075.h"
#include "../common.h"

//75. Sort Colors
//Medium
//1830
//166
//Favorite
//Share
//Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
//Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
//Note: You are not suppose to use the library's sort function for this problem.
//Example:
//Input: [2,0,2,1,1,0]
//Output: [0,0,1,1,2,2]
//Follow up:
//
//A rather straight forward solution is a two-pass algorithm using counting sort.
//First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
//Could you come up with a one-pass algorithm using only constant space?

//// one pass in place solution
//void sortColors(int A[], int n) {
//    int n0 = -1, n1 = -1, n2 = -1;
//    for (int i = 0; i < n; ++i) {
//        if (A[i] == 0)
//        {
//            A[++n2] = 2; A[++n1] = 1; A[++n0] = 0;
//        }
//        else if (A[i] == 1)
//        {
//            A[++n2] = 2; A[++n1] = 1;
//        }
//        else if (A[i] == 2)
//        {
//            A[++n2] = 2;
//        }
//    }
//}

//// one pass in place solution
//void sortColors(int A[], int n) {
//    int j = 0, k = n - 1;
//    for (int i = 0; i <= k; ++i){
//        if (A[i] == 0 && i != j)
//            swap(A[i--], A[j++]);
//        else if (A[i] == 2 && i != k)
//            swap(A[i--], A[k--]);
//    }
//}

//// one pass in place solution
//void sortColors(int A[], int n) {
//    int j = 0, k = n-1;
//    for (int i=0; i <= k; i++) {
//        if (A[i] == 0)
//            swap(A[i], A[j++]);
//        else if (A[i] == 2)
//            swap(A[i--], A[k--]);
//    }
//}

//void sortColors(int* nums, int numsSize){
//    int temp[numsSize];
//    memcpy(temp, nums, sizeof(int) * numsSize);
//    int pFirst = 0;
//    int pLast = numsSize - 1;
//    for (int i = 0; i < numsSize; i++) {
//        if (temp[i] == 0) {
//            nums[pFirst++] = 0;
//        }else if (temp[i] == 2) {
//            nums[pLast--] = 2;
//        }
//    }
//    while (pFirst <= pLast) {
//        nums[pFirst++] = 1;
//    }
//}


void sortColors(int* nums, int numsSize){
    int pointMin = 0;
    int pointMax = numsSize - 1;
    for (int i = 0; i <= pointMax; i++) {
        if (nums[i] == 0) {
            int temp = nums[i];
            nums[i] = nums[pointMin];
            nums[pointMin] = temp;
            pointMin++;
        }
        if (nums[i] == 2) {
            int temp = nums[i];
            nums[i] = nums[pointMax];
            nums[pointMax] = temp;
            pointMax--;
            i--;
        }
    }
}
int question75(){
    int randomSize = 10;
    int nums[randomSize];
    for (int i = 0; i < randomSize; i++) {
        nums[i] = arc4random() % 3;
        printf(" %d",nums[i]);
    }
    printf("\n");
    sortColors(nums, randomSize);
    for (int i = 0; i < randomSize; i++) {
        printf(" %d",nums[i]);
    }
    printf("\n");
    return 0;
}
