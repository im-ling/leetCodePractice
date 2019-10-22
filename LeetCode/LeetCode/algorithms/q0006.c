//
//  q0006.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0006.h"
#include "../common.h"

//6. ZigZag Conversion
//Medium
//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//And then read line by line: "PAHNAPLSIIGYIR"
//Write the code that will take a string and make this conversion given a number of rows:
//string convert(string s, int numRows);
//Example 1:
//Input: s = "PAYPALISHIRING", numRows = 3
//Output: "PAHNAPLSIIGYIR"
//Example 2:
//Input: s = "PAYPALISHIRING", numRows = 4
//Output: "PINALSIGYAHRPI"
//Explanation:
//P     I    N
//A   L S  I G
//Y A   H R
//P     I

////https://leetcode.com/problems/zigzag-conversion/discuss/3665/4ms-C-solution-with-explanation
///***
// Main Function
// ***/
//char * convert(char* s, int numRows)
//{
//    int len, w = (numRows - 2) * 2 + 2, i, t1, t2, r = numRows;
//    int cnt = (2 * r) - 3, c, j;    //cnt 等于左右移位个数，左右移位个数为r - 1
//    char *ns;
//
//    /* Maintain Sanity */
//    if (!s || !r)
//        return NULL;
//
//    /* Get the length */
//    len = (int) strlen(s);
//
//    /* If the number of rows less than two or is equal to or greater than
//     length, then there is no scope for conversion */
//    if ((r >= len) || (r < 2))
//        return s;
//
//    /* Allocate the buffer */
//    ns = malloc(sizeof(char) * len);
//    if (!ns)
//        return NULL;
//
//    /* First set of mapped characters are separated by the offset
//     difference calculated by the equation (row - 2) * 2 + 2.
//
//     0 1 2 3 4 5 6 7 8 9 10 11 12 13    < Old Offsets
//     P A Y P A L I S H I R  I  N  G
//     0       1       2         3        < New Mapped Offsets
//
//     PAHN                               < Partially converted string
//
//     */
//    for (i = 0, j = 0; i < len; i += w, ++j)
//        ns[j] = s[i];
//
//    /* Subsequent characters can be derived by scanning towards the
//     middle of these offset windows set by the above equation
//
//     0 1 2 3 4 5 6 7 8 9 10 11 12 13    < Old Offsets
//     P A Y P A L I S H I R  I  N  G
//     0       1       2         3        < Boundary Offsets
//     t1 <->  t2                         < Scan Window 0 - 4
//     t1 <->  t2                 < Scan Window 4 - 8
//     t1  <->   t2       < Scan Window 8 - 12
//     t1       < Scan Window 12 -13
//     ------------------------------------------------------
//     0 4   5 1 6   7 2 8    9  3  10    < Offsets (Iteration 0)
//     P A Y P A L I S H I R  I  N  G     < t1 + 1 & t2 - 1
//
//     "PAHNAPLSIIG"                      < Partially converted string
//
//     ------------------------------------------------------
//     0 4 11 5 1 6 12 7 2 8 13 9  3  10    < Offsets (Iteration 1)
//     P A Y  P A L I  S H I  R I  N  G     < t1 + 2 & t2 - 2
//
//     "PAHNAPLSIIGYIR"                     < Final Converted String
//     */
//    for (i = 0, c = 1; i < cnt; i += 2, ++c)
//    {
//        /* Initialize the scan window boundaries */
//        t1 = 0;
//        t2 = t1 + w;
//
//        /* Scan */
//        while ((t1 < len) || (t2 < len))
//        {
//            /* If the character is valid, then swap */
//            if ((t1 + c) < len)
//                ns[j++] = s[t1 + c];
//
//            if ((t1 + c) != (t2 - c) && ((t2 - c) < len))
//                ns[j++] = s[t2 - c];
//
//            /* Advance the scan window */
//            t1 = t2;
//            t2 = t2 + w;
//        }
//    }
//
//    /* Return Converted String */
//    memcpy(s, ns, len);
//    free(ns);
//    return s;
//}

// my solution
char* convert(char* s, int numRows) {
    int strLen = (int) strlen(s);
    if (strLen <= 1 || numRows <= 1) {
        return s;
    }

    char *result = calloc(1, sizeof(char) * (strLen + 1));
    int resultCount[numRows];
    memset(resultCount, 0, sizeof(int) * numRows);
    char resultTemp[numRows][strLen];
    memset(resultTemp, 0, sizeof(char) * strLen * numRows);

    int remainder = 0;
    int divisor = 2 * (numRows - 1);
    for (int i = 0; i < strLen; i++) {
        remainder = i % divisor;
        if (remainder >= numRows - 1) {
            remainder = divisor - remainder;
        }
        resultTemp[remainder][resultCount[remainder]] = s[i];
        resultCount[remainder]++;
    }
    char *p = result;
    for (int i = 0; i < numRows; i++) {
        memcpy(p, resultTemp[i], resultCount[i]);
        p += resultCount[i];
    }
    return result;
}

int question6(){
    char *s ="Apalindromeisaword,phrase,number,orothersequenceofunitsthatcanbereadthesamewayineitherdirection,withgeneralallowancesforadjustmentstopunctuationandworddividers.";
    printf("\nlongest %s",convert(s, 4));
    printf("\nfinished");
    return 0;
};
