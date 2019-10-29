//
//  q0067.c
//  LeetCode
//
//  Created by NowOrNever on 29/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0067.h"
#include "../common.h"

//67. Add Binary
//Easy
//
//1212
//
//226
//
//Favorite
//
//Share
//Given two binary strings, return their sum (also a binary string).
//
//The input strings are both non-empty and contains only characters 1 or 0.
//
//Example 1:
//
//Input: a = "11", b = "1"
//Output: "100"
//Example 2:
//
//Input: a = "1010", b = "1011"
//Output: "10101"
//Accepted
//353,118
//Submissions
//859,565

char * addBinary(char * a, char * b){
    if (a == NULL || strlen(a) < 1) {
        return b;
    }
    if (b == NULL || strlen(b) < 1) {
        return a;
    }
    int flag_compare_a_b = strlen(a) >= strlen(b);
    char * min_str = flag_compare_a_b ? b : a;
    char * max_str = flag_compare_a_b ? a : b;
    int max_len = (int) strlen(max_str);

    char *result = calloc(max_len + 2, sizeof(char));   //don't forget the tail '\0'
    
    int carry_bit = 0;
    int i = (int) strlen(min_str) - 1;
    int j = max_len - 1;
    int k = max_len;
    int temp_value = 0;
    while (i >= 0) {
        temp_value = (min_str[i--] == '1') + (max_str[j--] == '1') + carry_bit;
        carry_bit = temp_value / 2;
        temp_value %= 2;
        result[k--] = temp_value ? '1' : '0';
    }
    while (j >= 0) {
        temp_value = (max_str[j--] == '1') + carry_bit;
        carry_bit = temp_value / 2;
        temp_value %= 2;
        result[k--] = temp_value ? '1' : '0';
    }
    if (carry_bit) {
        result[0] = '1';
        return result;
    }
    return result + 1;
}

int question67(){
    char *s1 = "1010";
    char *s2 = "1011";
//    printf("\nlen(%d)\n",strlen(""));
    char *result = addBinary(s1, s2);
    printf("\"%s\" + \"%s\" = \"%s\" \n" , s1, s2, result);
    return 0;
}

// summarize
// don't forget the tail '\0'
