//
//  q0424.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0424.h"
#include "../common.h"

//424. Longest Repeating Character Replacement
//Medium
//625
//50
//Favorite
//
//Share
//Given a string s that consists of only uppercase English letters, you can perform at most k operations on that string.
//
//In one operation, you can choose any character of the string and change it to any other uppercase English character.
//
//Find the length of the longest sub-string containing all repeating letters you can get after performing the above operations.
//
//Note:
//Both the string's length and k will not exceed 104.
//
//Example 1:
//Input:
//s = "ABAB", k = 2
//Output:
//4
//Explanation:
//Replace the two 'A's with two 'B's or vice versa.
//
//
//Example 2:
//Input:
//s = "AABABBA", k = 1
//Output:
//4
//Explanation:
//Replace the one 'A' in the middle with 'B' and form "AABBBBA".
//The substring "BBBB" has the longest repeating letters, which is 4.
//Accepted
//36,249
//Submissions
//81,015

int characterReplacement(char * s, int k){
    if (s == NULL) {
        return 0;
    }
    int string_len = (int) strlen(s);
    int numberCount[128] = {0};
    int result = 0;
    
    int i = 0;
    int j = 0;
    int max = 0;
    
    while (j < string_len) {
        numberCount[(int) s[j] ]++;
        // max记录当前stack中，最多相同元素个数
        max = maxValue(max, numberCount[(int) s[j]]);
        if( j - i - max < k){
            if ( j - i + 1 > result) {
                result = j - i + 1;
//                printf("\n i(%d) j(%d) max(%d) s(%s) result(%d)", i, j, maxValueOfAArray(numberCount,'A' + 26), s + i, result);
//                printf("---");
            }
            j++;
        }else{
            numberCount[(int) s[i++] ]--;
            numberCount[(int) s[j] ]--;
        }
    }
    return result;
}

int question424(){
    char *s =
        "ABAA";
//        "ABAB";
//    "KRSCDCSONAJNHLBMDQGIFCPEKPOHQIHLTDIQGEKLRLCQNBOHNDQGHJPNDQPERNFSSSRDEQLFPCCCARFMDLHADJADAGNNSBNCJQOF";
//    "ABBB";
    int result = characterReplacement(s, 1);
    printf("\n question424 %d \n",result);
    return 0;
}
