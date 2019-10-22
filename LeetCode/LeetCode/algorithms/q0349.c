//
//  q0349.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0349.h"
#include "../common.h"


//349. Intersection of Two Arrays
//Easy
//449
//859
//Favorite
//
//Share
//Given two arrays, write a function to compute their intersection.
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [9,4]
//Note:
//
//Each element in the result must be unique.
//The result can be in any order.
//
//
//Accepted
//241,961
//Submissions
//431,435
int* intersection(int* nums1, int nums1Size, int* nums2, int nums2Size, int* returnSize){
    if (nums1 == NULL || nums2 == NULL) {
        return NULL;
    }
    int size = nums1Size < nums2Size ? nums1Size : nums2Size;
    int *result = (int*)calloc(size, sizeof(int));
    int tempNums1[nums1Size];
    memcpy(tempNums1, nums1, sizeof(int) * nums1Size);
    int tempNums2[nums2Size];
    memcpy(tempNums2, nums2, sizeof(int) * nums2Size);

    int k = 0;
    qsort(tempNums1, nums1Size, sizeof(int), compareIntFunction);
    qsort(tempNums2, nums2Size, sizeof(int), compareIntFunction);
    for (int i = 0,j = 0; i < nums1Size && j < nums2Size;) {
        if (tempNums1[i] > tempNums2[j]) {
            j++;
        }else if(tempNums1[i] < tempNums2[j]){
            i++;
        }else{
            if (k && tempNums1[i] == result[k - 1]) {
                i++;
                j++;
                continue;
            }
            result[k++] = tempNums1[i];
            i++;
            j++;
        }
    }
    *returnSize = k;
    return result;
}

//int* intersection(int* nums1, int nums1Size, int* nums2, int nums2Size, int* returnSize){
//    if (nums1 == NULL || nums2 == NULL) {
//        return NULL;
//    }
//    int size = nums1Size < nums2Size ? nums1Size : nums2Size;
//    int *result = (int*) malloc(size * sizeof(int));
//    //    int nums1[nums1Size];
//    //    memcpy(tempNums1, nums1, sizeof(int) * nums1Size);
//    //    int nums2[nums2Size];
//    //    memcpy(tempNums2, nums2, sizeof(int) * nums2Size);
//    int k = 0;
//    qsort(nums1, nums1Size, sizeof(int), compareIntFunction);
//    qsort(nums2, nums2Size, sizeof(int), compareIntFunction);
//    for (int i = 0,j = 0; i < nums1Size && j < nums2Size;) {
//        if (nums1[i] > nums2[j]) {
//            j++;
//        }else if(nums1[i] < nums2[j]){
//            i++;
//        }else{
//            if (k && result[k - 1] == nums1[i]) {
//                i++;
//                j++;
//                continue;
//            }
//            result[k++] = nums1[i];
//            i++;
//            j++;
//        }
//    }
//    *returnSize = k;
//    return result;
//}

int question349(){
    int nums1Size = 0;
    int nums1[] = {};
    int nums2Size = 0;
    int nums2[] = {};
    
    int returnSize = 0;
    int *result = intersection(nums1, nums1Size, nums2, nums2Size, &returnSize);
    for (int i = 0; i < returnSize; i++) {
        printf(" %d",*(result + i));
    }
    printf("\n");
    return 0;
}
