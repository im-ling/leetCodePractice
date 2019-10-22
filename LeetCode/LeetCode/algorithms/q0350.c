//
//  q0350.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0350.h"
#include "../common.h"

//350. Intersection of Two Arrays II
//Easy
//794
//282
//Favorite
//
//Share
//Given two arrays, write a function to compute their intersection.
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2,2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [4,9]
//Note:
//
//Each element in the result should appear as many times as it shows in both arrays.
//The result can be in any order.
//Follow up:
//
//What if the given array is already sorted? How would you optimize your algorithm?
//What if nums1's size is small compared to nums2's size? Which algorithm is better?
//What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
//Accepted
//230,600
//Submissions
//472,560

int* q350intersection(int* nums1, int nums1Size, int* nums2, int nums2Size, int* returnSize){
    if (nums1 == NULL || nums2 == NULL) {
        return NULL;
    }
    int size = nums1Size < nums2Size ? nums1Size : nums2Size;
    int *result = (int*) malloc(size * sizeof(int));
    int k = 0;
    qsort(nums1, nums1Size, sizeof(int), compareIntFunction);
    qsort(nums2, nums2Size, sizeof(int), compareIntFunction);
    for (int i = 0,j = 0; i < nums1Size && j < nums2Size;) {
        if (nums1[i] > nums2[j]) {
            j++;
        }else if(nums1[i] < nums2[j]){
            i++;
        }else{
            result[k++] = nums1[i];
            i++;
            j++;
        }
    }
    *returnSize = k;
    return result;
}

int question350(){
    int nums1Size = 0;
    int nums1[] = {};
    int nums2Size = 0;
    int nums2[] = {};
    
    int returnSize = 0;
    int *result = q350intersection(nums1, nums1Size, nums2, nums2Size, &returnSize);
    for (int i = 0; i < returnSize; i++) {
        printf(" %d",*(result + i));
    }
    printf("\n");
    return 0;
}
