//
//  q0012.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0012.h"
#include "../common.h"

//12. Integer to Roman
//Medium
//407
//1442
//
//
//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.
//
//Example 1:
//
//Input: 3
//Output: "III"
//Example 2:
//
//Input: 4
//Output: "IV"
//Example 3:
//
//Input: 9
//Output: "IX"
//Example 4:
//
//Input: 58
//Output: "LVIII"
//Explanation: L = 50, V = 5, III = 3.
//
//Example 5:
//Input: 1994
//Output: "MCMXCIV"
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.


int singleIntToRoman(int intput, char *output, char* romanChar);
char* intToRoman(int num) {
    //3888 = "MMMDCCCLXXXVIII";
    //3 + 12 + 1 = 16
    char romanChar[10] = "**MDCLXVI";
    char *result = calloc(1, sizeof(char) * 16);
    char *pResult = result;
    int fillCount = 0;
    int singleNumber = 0;
    char *p = romanChar;
    int divisor = 1000;
    while (divisor >= 1) {
        singleNumber = num / divisor;
        if (singleNumber) {
            fillCount = singleIntToRoman(singleNumber, pResult, p);
            pResult += fillCount;
            num -= singleNumber * divisor;
        }
        p++;
        p++;
        divisor /= 10;
    }
    return result;
}

int singleIntToRoman(int intput, char *output, char* romanChar){
    //    printf("\ninput(%d) output(%s) max(%c) middle(%c) min(%c)",intput, output, max, middle, min);
    char *p = output;
    char max = *romanChar++;
    char middle = *romanChar++;
    char min = *romanChar;
    switch (intput) {
        case 0:
            break;
        case 1:
            *p++ = min;
            break;
        case 2:
            *p++ = min;
            *p++ = min;
            break;
        case 3:
            *p++ = min;
            *p++ = min;
            *p++ = min;
            break;
        case 4:
            *p++ = min;
            *p++ = middle;
            break;
        case 5:
            *p++ = middle;
            break;
        case 6:
            *p++ = middle;
            *p++ = min;
            break;
        case 7:
            *p++ = middle;
            *p++ = min;
            *p++ = min;
            break;
        case 8:
            *p++ = middle;
            *p++ = min;
            *p++ = min;
            *p++ = min;
            break;
        case 9:
            *p++ = min;
            *p++ = max;
            break;
        default:
            break;
    }
    return (int)(p-output);
}
int question12(){
    printf("\nresult: %s\n",intToRoman(3));
    return 0;
}
