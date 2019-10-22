//
//  q0011.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0011.h"
#include "../common.h"

//11. Container With Most Water
//Medium
//2260
//386
//Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//Note: You may not slant the container and n is at least 2.
//
//The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
//
//Example:
//
//Input: [1,8,6,2,5,4,8,3,7]
//Output: 49

//int maxArea(int* height, int heightSize) {
//    int max = 0;
//    int current = 0;
//    for (int i = 0; i < heightSize; i++) {
//        for (int j = i + 1; j < heightSize; j++) {
//            current = MIN_AB(height[i], height[j]) * (j - i);
//            if (current > max) {
//                max = current;
//            }
//        }
//    }
//    return max;
//}

//skip lower height
int maxArea(int* height, int heightSize) {
    long max = 0;
    long current = 0;
    int currentHeight = 0;

    int *pLeft = height;
    int *pRight= height + heightSize - 1;
    while (pLeft < pRight) {
        currentHeight = MIN_AB(*pLeft, *pRight);
        current = currentHeight * (pRight - pLeft);
        if (current > max) {
            max = current;
        }
        while (*pLeft  <= currentHeight && pLeft < pRight) {
            pLeft++;
        }
        while (*pRight <= currentHeight && pLeft < pRight) {
            pRight--;
        }
    }
    return (int)max;
}

//
//int maxArea(int* heights, int n) {
//    int water = 0, *i = heights, *j = i + n - 1;
//    while (i < j) {
//        int h = *i < *j ? *i : *j;
//        int w = (j - i) * h;
//        if (w > water) water = w;
//        while (*i <= h && i < j) i++;
//        while (*j <= h && i < j) j--;
//    }
//    return water;
//}
int question11(){
//    int testHeights[9] = {1,8,6,2,5,4,8,3,7};
    int testHeights[4] = {1,9,9,1};
    printf("maxArea %d \n",maxArea(testHeights, 4));
    return 0;
};
