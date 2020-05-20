//
//  q0438.c
//  LeetCode
//
//  Created by NowOrNever on 18/05/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0438.h"
#include "common.h"
//438. Find All Anagrams in a String
//Medium
//
//2620
//
//166
//
//Add to List
//
//Share
//Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
//
//Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
//
//The order of output does not matter.
//
//Example 1:
//
//Input:
//s: "cbaebabacd" p: "abc"
//
//Output:
//[0, 6]
//
//Explanation:
//The substring with start index = 0 is "cba", which is an anagram of "abc".
//The substring with start index = 6 is "bac", which is an anagram of "abc".
//Example 2:
//
//Input:
//s: "abab" p: "ab"
//
//Output:
//[0, 1, 2]
//
//Explanation:
//The substring with start index = 0 is "ab", which is an anagram of "ab".
//The substring with start index = 1 is "ba", which is an anagram of "ab".
//The substring with start index = 2 is "ab", which is an anagram of "ab".
//Accepted
//217,677
//Submissions
//521,596
int* findAnagrams(char * s, char * p, int* returnSize){
    *returnSize = 0;
    size_t p_len = strlen(p);
    size_t s_len = strlen(s);
    int *result = malloc(sizeof(int) * (s_len + 1));
    if (s_len <= 0 || s_len < p_len) {
        return result;
    }
    int ascii[128] = {0};
    
    // p的字符
    size_t count = p_len;
    while (*p) {
        ascii[*p++]++;
    }
    
    // first window
    char *start = s;
    char *end = s;
    for (int i = 0; i < p_len; i++) {
        if(ascii[*end++]-- > 0) count--;
    }
    if (!count){
        result[(*returnSize)++] = (int)(start - s);
    }
    
    // window move
    while (*end) {
        if(++ascii[*start++] > 0) count++;
        if(ascii[*end++]-- > 0) count--;
        if (!count) {
            result[(*returnSize)++] = (int)(start - s);
        }
    }
    return result;
}



int question438(void){
    char *s1 =
        "";
    char *s2 =
        "a";
    int size = 0;
    int *result = findAnagrams(s1, s2, &size);
    for (int i = 0; i < size; i++) {
        printf("%d ",result[i]);
    }
    return 0;
}
