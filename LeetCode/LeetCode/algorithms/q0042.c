//
//  q0042.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0042.h"
#include "../common.h"

//42. Trapping Rain Water
//Hard
//
//2918
//
//51
//
//Favorite
//
//Share
//Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
//
//
//The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
//
//Example:
//
//Input: [0,1,0,2,1,0,1,3,2,1,2,1]
//Output: 6
//Accepted
//252,295
//Submissions
//605,652

/**
int trap(int* height, int heightSize) {
    if (heightSize <= 1) {
        return 0;
    }
    int result = 0;
    int *newHeights = calloc(heightSize, sizeof(int));
    memcpy(newHeights, height, heightSize * sizeof(int));
    qsort(newHeights, heightSize, sizeof(int), compareIntFunction);
    int count = 1;
    for (int i = 1; i < heightSize; i++) {
        if (newHeights[i] > newHeights[i - 1]) {
            //            printf("\nnewheight[%d] = %d",count, newHeights[i]);
            newHeights[count++] = newHeights[i];
        }
    }
    
    int lastLeft = heightSize - 1;
    int lastRight = 0;
    int firstTimeFlag = true;
    for (int i = count - 1; i >= 0; i--) {
        //        printf("\ncurretn number %d result %d", newHeights[i], result);
        int left = 0;
        int right = heightSize - 1;
        while (left < heightSize && height[left++] < newHeights[i]) {
        }
        while (right >= 0 && height[right--] < newHeights[i]) {
        }
        left--;
        right++;
        if (firstTimeFlag) {
            firstTimeFlag = false;
            for (int j = left; j < right; j++) {
                if (newHeights[i] > height[j]) {
                    result = result + newHeights[i] - height[j];
                }
            }
        }else{
            for (int j = left; j < lastLeft; j++) {
                if (newHeights[i] > height[j]) {
                    result = result + newHeights[i] - height[j];
                }
            }
            for (int j = right; j > lastRight; j--) {
                if (newHeights[i] > height[j]) {
                    result = result + newHeights[i] - height[j];
                }
            }
        }
        lastLeft = left;
        lastRight = right;
    }
    return result;
}
*/

int MinInt(int a, int b){
    return a < b ? a : b;
}


int trap(int* height, int heightSize) {
    if (heightSize <= 1) {
        return 0;
    }
    int result = 0;
    int stackIndex = 0;
    int stackSize = heightSize;
    int stackIndexArray[stackSize];
    int stackHeightArray[stackSize];
    memset(stackIndexArray , 0, stackSize * sizeof(int));
    memset(stackHeightArray, 0, stackSize * sizeof(int));
    
    stackIndexArray[stackIndex] = 0;
    stackHeightArray[stackIndex] = height[0];
    for (int i = 1; i < heightSize; i++) {
        while (stackIndex >= 0 && height[i] >= stackHeightArray[stackIndex]) {
            if (stackIndex > 0) {
                //                printf("\nresult(%d) i(%d) stackIndex(%d) ; %d * (%d - %d)",result, i, stackIndex, (i - stackIndexArray[stackIndex - 1] - 1),MIN(stackHeightArray[stackIndex - 1], height[i]), stackHeightArray[stackIndex]);
                result += (i - stackIndexArray[stackIndex - 1] - 1) * (MinInt(stackHeightArray[stackIndex - 1], height[i]) - stackHeightArray[stackIndex]);
            }
            stackIndex--;
        }
        stackIndex++;
        stackHeightArray[stackIndex] = height[i];
        stackIndexArray[stackIndex] = i;
    }
    return result;
}
int question42(){
    int nums[] =
    {4,2,3};
    //    {2,0,2};
    //    {0,1,0,2,1,0,1,3,2,1,2,1};
    int result = trap(nums, sizeof(nums) / sizeof(nums[0]));
    printf("\ntrap %d",result);
    return 0;
}
