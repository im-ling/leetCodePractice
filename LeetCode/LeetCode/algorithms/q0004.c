//
//  q0004.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0004.h"
#include "../common.h"

//4. Median of Two Sorted Arrays
//Hard
//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//You may assume nums1 and nums2 cannot be both empty.
//Example 1:
//nums1 = [1, 3]
//nums2 = [2]
//The median is 2.0
//Example 2:
//nums1 = [1, 2]
//nums2 = [3, 4]
//The median is (2 + 3)/2 = 2.5
double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size) {
    double result = 0;
    int newNumberSize = nums1Size + nums2Size;
    int *newNumbers = malloc(sizeof(int) * newNumberSize);
    memset(newNumbers, 0, sizeof(int) * newNumberSize);
    int *p = newNumbers;
    int i = 0;
    int j = 0;
    while (i < nums1Size && j < nums2Size) {
        if (nums1[i] < nums2[j]) {
            *p++ = nums1[i++];
        }else{
            *p++ = nums2[j++];
        }
    }
    if (i >= nums1Size) {
        while (j < nums2Size) {
            *p++ = nums2[j++];
        }
    }else{
        while (i < nums1Size) {
            *p++ = nums1[i++];
        }
    }
    int index = newNumberSize / 2;
    if (newNumberSize % 2) {
        result = newNumbers[index];
    }else{
        result = newNumbers[index] + newNumbers[index - 1];
        result = result / 2.0;
    }
    free(newNumbers);
    return result;
}

int question4(){
    int nums1[] = {1, 2};
    int nums2[] = {3, 4};
    double result = findMedianSortedArrays(nums1, 2, nums2, 2);
    printf("meddlevalue %lf",result);
    return 0;
};
