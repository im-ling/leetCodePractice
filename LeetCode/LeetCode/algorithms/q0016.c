//
//  q0016.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0016.h"
#include "../common.h"

//16. 3Sum Closest
//Medium
//757
//58
//Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//Example:
//
//Given array nums = [-1, 2, 1, -4], and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).



int threeSumClosest(int* nums, int numsSize, int target){
    if (numsSize < 3) {
        return 0;
    }
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    int result = INT32_MAX;
    int rangeClose  = INT32_MAX;
    int indexLeft = 0;
    int indexMiddle  = 0;
    int indexRight = 0;

    int current = 0;
    int currentRange = INT32_MAX;

    for (indexLeft = 0; indexLeft < numsSize - 2 ; indexLeft++) {
        indexMiddle = indexLeft+1;
        indexRight = numsSize - 1;
        while (indexMiddle < indexRight) {
            current = nums[indexLeft] + nums[indexMiddle] + nums[indexRight];
            if (current == target) {
                return target;
            }else if (current < target){
                indexMiddle++;
                currentRange = target - current;
            }else{
                currentRange = current - target;
                indexRight--;
            }
            if (currentRange < rangeClose) {
                rangeClose = currentRange;
                result = current;
            }
        }
    }
    return result;
}


//int threeSumClosest(int* nums, int numsSize, int target) {
//    if (numsSize < 3) {
//        return 0;
//    }
//    qsort(nums, numsSize, sizeof(int), compareFunction);
////    for (int i = 0; i < numsSize; i++) {
////        printf(" %d ",nums[i]);
////    }
//    int range = INT32_MAX;
//    int closest = INT32_MAX;
//    int current = 0;
//    for (int i = 0; i < numsSize;) {
//        for (int j = i + 1; j < numsSize;) {
//            for (int k = j + 1; k < numsSize;) {
//                current = nums[i] + nums[j] + nums[k];
////                printf("\n %d %d %d current %d abs(%d) range(%d)", nums[i], nums[j], nums[k],current, abs(target - current),range);
//                if (current == target) {
//                    return target;
//                }else if (range > abs(target - current)){
//                    closest = current;
//                    range = abs(target - current);
////                    k = numsSize;
//                }
//                int kValue = nums[k];
//                while (nums[++k] <= kValue) {
//                }
//            }
//            int jValue = nums[j];
//            while (nums[++j] <= jValue) {
//            }
//        }
//        int iValue = nums[i];
//        while (nums[++i] <= iValue) {
//        }
//
//    }
//    return closest;
//}
int question16(){
    int nums[] =
//    {-1, 2, 1, -4};
    {1,1,-1,-1,3};
    printf("\n ThreeSumClosest is : %d \n",threeSumClosest(nums, 5, 3));
    return 0;
}
