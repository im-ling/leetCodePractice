//
//  q0457.c
//  LeetCode
//
//  Created by NowOrNever on 27/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0457.h"
#include "../common.h"

//457. Circular Array Loop
//Medium
//
//192
//
//1050
//
//Favorite
//
//Share
//You are given a circular array nums of positive and negative integers. If a number k at an index is positive, then move forward k steps. Conversely, if it's negative (-k), move backward k steps. Since the array is circular, you may assume that the last element's next element is the first element, and the first element's previous element is the last element.
//
//Determine if there is a loop (or a cycle) in nums. A cycle must start and end at the same index and the cycle's length > 1. Furthermore, movements in a cycle must all follow a single direction. In other words, a cycle must not consist of both forward and backward movements.
//
//
//
//Example 1:
//
//Input: [2,-1,1,2,2]
//Output: true
//Explanation: There is a cycle, from index 0 -> 2 -> 3 -> 0. The cycle's length is 3.
//Example 2:
//
//Input: [-1,2]
//Output: false
//Explanation: The movement from index 1 -> 1 -> 1 ... is not a cycle, because the cycle's length is 1. By definition the cycle's length must be greater than 1.
//Example 3:
//
//Input: [-2,1,-1,-2,-2]
//Output: false
//Explanation: The movement from index 1 -> 2 -> 1 -> ... is not a cycle, because movement from index 1 -> 2 is a forward movement, but movement from index 2 -> 1 is a backward movement. All movements in a cycle must follow a single direction.
//
//
//Note:
//
//-1000 ≤ nums[i] ≤ 1000
//nums[i] ≠ 0
//1 ≤ nums.length ≤ 5000
//
//
//Follow up:
//
//Could you solve it in O(n) time complexity and O(1) extra space complexity?
//
//Accepted
//23,428
//Submissions
//83,243


/**
本题注意：
 1、 circle里的元素方向一致，“Furthermore, movements in a cycle must all follow a single direction.”
 2、检验不是index0开头的路径就可以，需要检验所有index
*/

bool circularArrayLoop(int* nums, int numsSize){
    for (int i = 0; i < numsSize; i++) {
        nums[i] %= numsSize;    //normalization
    }
    for (int i = 0; i < numsSize; i++) {
        int direction = nums[i] > 0;
        for (int j = i; nums[j] < numsSize && direction == nums[j] > 0;) {
            int temp_j = j;
            j = (j + numsSize + nums[j]) % numsSize;
            if (nums[j] == numsSize + i) {  //是否本轮走过
                return true;
            }
            nums[temp_j] = numsSize + i;
        }
    }
    return false;
}

/**
总结：
1、不是o(1)extra对应的就是fast和slow，
2、能不能改原数据不是定死的，需灵活变化
2.1、必要的预处理很重要，常见的预处理有：排序，标准化
3、空间复杂度的o(1)不是1一个变量的空间，指的是固定常量的空间
3.1、同上，时间复杂度o(n)不一定指的就是单个循环，是o(2n)、o（3n）的统称；
4、时间复杂度o(n²)和h循环嵌套循环不完全等价，里层循环与外面的循环互斥，也可认为o(n)
5、不要太拘泥于形式，leetcode上面的时间、内存判定也有误差，在答案相同时，不需要在0、4ms时间消耗上，0.1、0.2m空间消耗上做文章
*/

//fast slow pointer
bool circularArrayLoop2(int* nums, int numsSize){
    if (nums == NULL || numsSize < 2) {
        return false;
    }
    for (int i = 0; i < numsSize; i++) {    //normalization 标准化
        nums[i] %= numsSize;
    }
    for (int j = 0; j < numsSize; j++) {
        int slow = j;
        int fast = j;
        slow = (nums[slow] + slow + numsSize) % numsSize;   // slow = slow_next
        fast = (nums[fast] + fast + numsSize) % numsSize;
        fast = (nums[fast] + fast + numsSize) % numsSize;

        while (slow != fast) {
            slow = (nums[slow] + slow + numsSize) % numsSize;
            fast = (nums[fast] + fast + numsSize) % numsSize;
            fast = (nums[fast] + fast + numsSize) % numsSize;
        }
        if (slow == (nums[slow] + slow + numsSize) % numsSize) {    // slow == slow_next, try next j
            continue;
        }
        slow = (nums[slow] + slow + numsSize) % numsSize;
        bool flag = true;
        while (slow != fast) {
            if (nums[fast] * nums[slow] < 0) {  //not a single direction
                flag = false;
                break;
            }
            slow = (nums[slow] + slow + numsSize) % numsSize;
        }
        if (flag) {
            return true;
        }
    }
    return false;
}


int question457(){
    int nums[] =
        {1, 2, 3, 4, 5};
//        {-1 , 2};
//        {3, 1, 2};
//        {0,1,2};
//        {2,-1,1,-2,-2};
    
    bool result = circularArrayLoop(nums, sizeof(nums) / sizeof(int));
    printf("question457: %d\n", result);
    return 0;
}
