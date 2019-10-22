//
//  q0532.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0532.h"
#include "../common.h"

//532. K-diff Pairs in an Array
//Easy
//392
//881
//Favorite
//
//Share
//Given an array of integers and an integer k, you need to find the number of unique k-diff pairs in the array. Here a k-diff pair is defined as an integer pair (i, j), where i and j are both numbers in the array and their absolute difference is k.
//
//Example 1:
//Input: [3, 1, 4, 1, 5], k = 2
//Output: 2
//Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
//Although we have two 1s in the input, we should only return the number of unique pairs.
//Example 2:
//Input:[1, 2, 3, 4, 5], k = 1
//Output: 4
//Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).
//Example 3:
//Input: [1, 3, 1, 5, 4], k = 0
//Output: 1
//Explanation: There is one 0-diff pair in the array, (1, 1).
//Note:
//The pairs (i, j) and (j, i) count as the same pair.
//The length of the array won't exceed 10,000.
//All the integers in the given input belong to the range: [-1e7, 1e7].
//Accepted
//71,831
//Submissions
//237,500
int findPairs(int* nums, int numsSize, int k){
    if (nums == NULL || numsSize < 2) {
        return 0;
    }
    int result = 0;
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
//    for (int i = 0; i < numsSize; i++) {
//        printf(" %d",nums[i]);
//    }
    int tempNumber = nums[0] - 1;
    for (int i = 0; i < numsSize; i++) {
        if (tempNumber != nums[i]) {
            tempNumber = nums[i];
            for (int j = i + 1; j < numsSize; j++) {
                if (nums[j] - nums[i] > k) {
                    j = numsSize;
                }else if(nums[j] - nums[i] == k){
                    result++;
                    j = numsSize;
                }
            }
        }
    }
    return result;
}

//int findPairs(int* nums, int numsSize, int k){
//    int result = 0;
//    qsort(nums, numsSize, sizeof(int), compareIntFunction);
//    //    for (int i = 0; i < numsSize; i++) {
//    //        printf(" %d",nums[i]);
//    //    }
//
//    int i = 0;
//    while (i < numsSize) {
//        int j = i + 1;
//        while (j < numsSize) {
//            if (nums[j] - nums[i] == k) {
//                result++;
//                j = numsSize;
//            }else if (nums[j] - nums[i] > k) {
//                j = numsSize;
//            }
//            j++;
//        }
//        i++;
//        while (i < numsSize && nums[i] == nums[i - 1]) {
//            i++;
//        }
//    }
//    return result;
//}

int question532(){
    int array[] = {1,1,1,2,1};
    int size = sizeof(array) / sizeof(int);
    int k = 1;
    int result = findPairs(array, size, k);
    printf("\n result = %d \n",result);
    return 0;
}
