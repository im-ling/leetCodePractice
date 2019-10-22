//
//  q0076.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0076.h"
#include "../common.h"

//76. Minimum Window Substring
//Hard
//
//2920
//
//210
//
//Favorite
//
//Share
//Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
//
//Example:
//
//Input: S = "ADOBECODEBANC", T = "ABC"
//Output: "BANC"
//Note:
//
//If there is no such window in S that covers all characters in T, return the empty string "".
//If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
//Accepted
//287,665
//Submissions
//892,426

char* minWindow(char* s, char* t){
    char *result = "";
    if (s == NULL || t == NULL) {
        return result;
    }
    int str_len_s = (int) strlen(s);
    int str_len_t = (int) strlen(t);
    if (str_len_t < 1 || str_len_s < 1) {
        return result;
    }
    int count[ASCIISIZE] = {0};
    for (int i = 0; i < ASCIISIZE; i++) {   //mark all the characters in s
        count[i] = -str_len_t;
    }
    for (int i = 0; i < str_len_t; i++) {   //mark all the characters in t
        count[t[i]] = 0;
    }
    for (int i = 0; i < str_len_t; i++) {   //record times of all the characters in t
        count[t[i]]++;
    }
    
    char *start = s;
    char *end = s;
    int result_len = INT_MAX;
    char *result_pointer = s;
    
    while (*end) {
        if (count[*end]-- > 0) { //if *end is the element of string t
            str_len_t--;
        }
        printf("\n result_len(%d) str_len_t(%d) A(%d) B(%d) C(%d) start(%s) end(%s)", result_len, str_len_t, count['A'], count['B'], count['C'], start, end);
        end++;
        while (str_len_t == 0) {
            if (result_len > end - start) {
                result_len = (int)(end - start);
                result_pointer = start;
            }
            if (++count[*start] > 0) {  //remove prefix
                str_len_t++;
            }
            start++;
        }
    }
    printf("\n result_len(%d) str_len_t(%d) A(%d) B(%d) C(%d) start(%s) end(%s)", result_len, str_len_t, count['A'], count['B'], count['C'], start, end);

    if (result_len == INT_MAX) {
        return result;
    }
    result = calloc(result_len + 1, sizeof(char));
    memcpy(result, result_pointer, result_len);
    return result;
}
int question76(){
    char *s = "ADOBBECODEBANC";
    char *t = "ABC";
    char *result = minWindow(s,t);
    printf("\n question76 is : %s\n",result);
    return 0;
}
