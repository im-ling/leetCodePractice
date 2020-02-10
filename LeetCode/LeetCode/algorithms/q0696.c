//
//  q0696.c
//  LeetCode
//
//  Created by NowOrNever on 10/02/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0696.h"
#include "../common.h"


//696. Count Binary Substrings
//Easy
//
//796
//
//141
//
//Add to List
//
//Share
//Give a string s, count the number of non-empty (contiguous) substrings that have the same number of 0's and 1's, and all the 0's and all the 1's in these substrings are grouped consecutively.
//
//Substrings that occur multiple times are counted the number of times they occur.
//
//Example 1:
//Input: "00110011"
//Output: 6
//Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
//
//Notice that some of these substrings repeat and are counted the number of times they occur.
//
//Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.
//Example 2:
//Input: "10101"
//Output: 4
//Explanation: There are 4 substrings: "10", "01", "10", "01" that have equal number of consecutive 1's and 0's.
//Note:
//
//s.length will be between 1 and 50,000.
//s will only consist of "0" or "1" characters.
//Accepted
//39,498
//Submissions
//71,874

int countBinarySubstrings(char * s){
    int result = 0;
    char *p_end = s + strlen(s);
    char *p = s;
    char *position = p;
    int count_pre = 0;
    int count_cur = 0;

    while (p < p_end) {
        count_pre = count_cur;
        count_cur = 0;
        while (*position == *p){
            count_cur++;
            p++;
        }
        result += count_pre < count_cur ? count_pre : count_cur;
        position = p;
    }

    return result;
}

int question696(){
    char *s = "00110";
    printf("result %d\n", countBinarySubstrings(s));
    return 0;
}
