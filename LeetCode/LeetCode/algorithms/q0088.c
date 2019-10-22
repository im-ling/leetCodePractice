//
//  q0088.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0088.h"
#include "../common.h"

//88. Merge Sorted Array
//Easy
//1236
//2978
//Favorite
//Share
//Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
//
//Note:
//The number of elements initialized in nums1 and nums2 are m and n respectively.
//You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
//Example:
//
//Input:
//nums1 = [1,2,3,0,0,0], m = 3
//nums2 = [2,5,6],       n = 3
//
//Output: [1,2,2,3,5,6]
//Accepted
//398,638
//Submissions
//1,092,224

//void merge(int* nums1, int nums1Size, int m, int* nums2, int nums2Size, int n){
//    if (m < 1) {
//        memcpy(nums1, nums2, sizeof(int) * n);
//        return;
//    }
//    int temp[m];
//    memcpy(temp, nums1, sizeof(int) * m);
//    int i = 0;
//    int j = 0;
//    while (i < m && j < n) {
//        if(temp[i] > nums2[j]){
//            *nums1++ = nums2[j++];
//        }else{
//            *nums1++ = temp[i++];
//        }
//    }
//    if (i == m) {
//        while (j < n) {
//            *nums1++ = nums2[j++];
//        }
//    }else{
//        while (i < m) {
//            *nums1++ = temp[i++];
//        }
//    }
//}


void merge(int* nums1, int nums1Size, int m, int* nums2, int nums2Size, int n){
    int *p = nums1 + n + m - 1;
    int *p1 = nums1 + m - 1;
    int *p2 = nums2 + n - 1;
    while (p2 >= nums2 && p1 >= nums1) {
        if (*p2 > *p1) {
            *p-- = *p2--;
        }else{
            *p-- = *p1--;
        }
    }
    if (p1 < nums1) {
        while (p2 >= nums2) {
            *p-- = *p2--;
        }
    }
}


int question88(){
    int arrayLen = 10;
    int arrayLen2 = arrayLen/2;
    int threshold = arrayLen;
    int array1[arrayLen];
    int array2[arrayLen2];
    for (int i = 0; i < arrayLen; i++) {
        if (i < arrayLen2) {
            array2[i] = arc4random() % threshold;
            array1[i + arrayLen2] = 0;
        }else{
            array1[i - arrayLen2]  = arc4random() % threshold;
        }
    }
    qsort(array1, arrayLen - arrayLen2, sizeof(int), compareIntFunction);
    qsort(array2, arrayLen2, sizeof(int), compareIntFunction);

    for (int i = 0; i < arrayLen; i++) {
        printf("%d ",array1[i]);
    }
    printf("\n");
    for (int i = 0; i < arrayLen2; i++) {
        printf("%d ",array2[i]);
    }
    printf("\n");

    merge(array1, arrayLen, arrayLen - arrayLen2, array2, arrayLen2, arrayLen2);
    for (int i = 0; i < arrayLen; i++) {
        printf("%d ",array1[i]);
    }
    printf("\n");
    return 0;
}
