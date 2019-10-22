//
//  q0038.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0038.h"
#include "../common.h"

//38. Count and Say
//Easy
//
//596
//
//4139
//
//Favorite
//
//Share
//The count-and-say sequence is the sequence of integers with the first five terms as following:
//
//1.     1
//2.     11
//3.     21
//4.     1211
//5.     111221
//1 is read off as "one 1" or 11.
//11 is read off as "two 1s" or 21.
//21 is read off as "one 2, then one 1" or 1211.
//
//Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence.
//
//Note: Each term of the sequence of integers will be represented as a string.
//
//
//
//Example 1:
//
//Input: 1
//Output: "1"
//Example 2:
//
//Input: 4
//Output: "1211"
int countANumber(char *say, char *text,char *end, int n, int *len){
    if (n == 1) {
        return 0;
    }
    char *pSay = say;
    char *pText= text;
    int lastNumber = -1;
    int count = 0;
    while (pText != end) {
        if (*pText != lastNumber) {
            if (count) {
//                if (count > 9) {
//                    printf("error");
//                    return 0;
//                }
                *pSay++ = count;
                *pSay++ = lastNumber;
            }
            lastNumber = *pText;
            count = 1;
        }else{
            count++;
        }
        pText++;
    }
    if (count) {
        *pSay++ = count;
        *pSay++ = lastNumber;
    }
    *len = (int)(pSay - say);
    countANumber(text, say, pSay, n - 1, len);
    return 0;
}

char* countAndSay(int n) {
    int enoughLen = 5000;//N = 30, LEN = 4444
    char *number1 = calloc(enoughLen, sizeof(char));
    char *number2 = calloc(enoughLen, sizeof(char));

    *number1 = 1;
    int count = 1;
    countANumber(number2, number1, number1 + 1, n, &count);

    char *number = NULL;
    if (n % 2 == 1) {
        number = number1;
    }else{
        number = number2;
    }
    char *result = calloc(count + 1, sizeof(char));
    char *pResult = result;
    for (int i = 0; i < count; i++) {
        *pResult++ = number[i] + '0';
    }
    free(number1);
    free(number2);
    return result;
}
int question38(void){
    char *result = countAndSay(30);
    printf("\nresult(%s)\n",result);
    return 0;
}
