//
//  q0003.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0003.h"
#include "../common.h"

//3. Longest Substring Without Repeating Characters
//Medium
//Given a string, find the length of the longest substring without repeating characters.
//Example 1:
//Input: "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.
//Example 2:
//Input: "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.
//Example 3:
//Input: "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

// one of the best answer
//思想：i为当前报数，j为之前重复的index的最大；i-j+1为当前值的无重复个数
int lengthOfLongestSubstring(char* s)
{
    int i , j = 0;
    int length = (int) strlen(s);
    if(length <= 1)
        return length;

    int ans = 0;
    int bucket[ASCIISIZE];
    for (i = 0; i < ASCIISIZE; i++)
        bucket[i] = -1;

    for (i = 0; i < length; i++){
        if (bucket[s[i]] < 0)
            bucket[s[i]] = i;   //若标志位没置，说明没有使用过
        else{
            if (j < bucket[s[i]] + 1) //j为重复值的上一个index，若出现重复值，然而其index不如j的话，那就没必要再更新j了，因为j的index已经重复了
                j = bucket[s[i]] + 1;
            bucket[s[i]] = i;
        }
        if(i - j + 1 > ans)
            ans = i - j + 1;
    }
    return ans;
}

int question3(){
    printf("maxleng : %d",lengthOfLongestSubstring("bacdefahijklmnokpb"));
    return 0;
};
