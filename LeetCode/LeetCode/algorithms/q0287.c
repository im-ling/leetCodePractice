//
//  q0287.c
//  LeetCode
//
//  Created by NowOrNever on 25/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0287.h"
#include "../common.h"

//287. Find the Duplicate Number
//Medium
//
//3033
//
//353
//
//Favorite
//
//Share
//Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.
//
//Example 1:
//
//Input: [1,3,4,2,2]
//Output: 2
//Example 2:
//
//Input: [3,1,3,4,2]
//Output: 3
//Note:
//
//You must not modify the array (assume the array is read only).
//You must use only constant, O(1) extra space.
//Your runtime complexity should be less than O(n2).
//There is only one duplicate number in the array, but it could be repeated more than once.
//Accepted
//230,106
//Submissions
//447,585

//int findDuplicate(int* nums, int numsSize){
//    bool flag[numsSize];
//    for (int i = 0; i < numsSize; i++) {
//        flag[i] = 0;
//    }
//    for (int i = 0; i < numsSize; i++) {
//        if (flag[nums[i]]) {
//            return nums[i];
//        }else{
//            flag[nums[i]] = 1;
//        }
//    }
//    return -1;
//}


/**
 此题可视为q142的一个子集，
 根据“Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist”，
 可以推导出，
 1、此处必然有一个以上的环circle（事实上，n个integers  where each integer is between 1 and n (inclusive)，已经是一个环了）
 2、nums[0]必然不是环中的成员（因为每个元素都是between 1 and n的,没有元素的值是0，即没有元素指向 nums[0]）
 再根据"Assume that there is only one duplicate number",可以得知：
 3、结论1的环，必然只有一个
 所以根据num[0]的值，num[num[0],num[num[num[0]]]]、、、、必然有个指向circle中的一个元素，
 设这个元素为num[k]，从num[0]到num[k]到结论1中circle，可以构成一个q142中的环形链表；
 */

int findDuplicate(int* nums, int numsSize){
    int slow = nums[0];
    int fast = nums[nums[0]];
    while (fast != slow) {
        slow = nums[slow];
        fast = nums[nums[fast]];
    }
    
    fast = 0;
    while (fast != slow) {
        slow = nums[slow];
        fast = nums[nums[fast]];
    }
    return nums[fast];
}


int question287(){
    int nums[] =
//        {1,3,4,2,2};
    {3,1,3,4,2};
    int result = findDuplicate(nums, sizeof(nums)/sizeof(int));
    printf("\nresult: %d\n", result);
    return 0;
}
