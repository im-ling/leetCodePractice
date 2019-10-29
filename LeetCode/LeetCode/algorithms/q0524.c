//
//  q0524.c
//  LeetCode
//
//  Created by NowOrNever on 28/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0524.h"
#include "../common.h"


//524. Longest Word in Dictionary through Deleting
//Medium
//
//394
//
//196
//
//Favorite
//
//Share
//Given a string and a string dictionary, find the longest string in the dictionary that can be formed by deleting some characters of the given string. If there are more than one possible results, return the longest word with the smallest lexicographical order. If there is no possible result, return the empty string.
//
//Example 1:
//Input:
//s = "abpcplea", d = ["ale","apple","monkey","plea"]
//
//Output:
//"apple"
//Example 2:
//Input:
//s = "abpcplea", d = ["a","b","c"]
//
//Output:
//"a"
//Note:
//All the strings in the input will only contain lower-case letters.
//The size of the dictionary won't exceed 1,000.
//The length of all the strings in the input won't exceed 1,000.
//Accepted
//52,100
//Submissions
//111,216
//

char * findLongestWord3(char * s, char ** d, int dSize){
    char *result = "";
    if (s == NULL || strlen(s) < 1 || d == NULL || dSize < 1) {
        return result;
    }
    
    // sort d
    int len_d[dSize];
    for (int i = 0; i < dSize; i++) {
        len_d[i] = (int) strlen(d[i]);
    }
    
    int temp;
    char *temp_p;
    for (int i = 0; i < dSize; i++) {
        for (int j = i + 1; j < dSize; j++) {
            if (len_d[j] > len_d[i] || (len_d[j] == len_d[i] && strcmp(d[i], d[j]) > 0)) {
                temp = len_d[i];
                len_d[i] = len_d[j];
                len_d[j] = temp;
                temp_p = d[i];
                d[i] = d[j];
                d[j] = temp_p;
            }
        }
    }
    
    // record first & lastappearance of every characters
    int last_appearance[ASCIISIZE];
    int first_appearance[ASCIISIZE];
    memset(last_appearance, 0 , sizeof(int) * ASCIISIZE);
    int len_s = (int) strlen(s);
    for (int i = 'a'; i <= 'z' ; i++) {
        first_appearance[i] = len_s;
    }
    for (int i = 0; i < len_s; i++) {
        last_appearance[s[i]] = i;
        first_appearance[s[len_s - i - 1]] = len_s - i - 1;
    }

    for (int i = 0; i < dSize; i++) {
        int point_d = 0;
        for (int j = first_appearance[d[i][0]]; j <= last_appearance[s[j]] && point_d < len_d[i]; j++) {
            if(s[j] == d[i][point_d]){
                point_d++;
            }
        }
        if (point_d == len_d[i]) {
            return d[i];
        }
    }
    return result;
}

char * findLongestWord2(char * s, char ** d, int dSize){
    char *result = "";
    if (s == NULL || strlen(s) < 1 || d == NULL || dSize < 1) {
        return result;
    }
    
    int last_appearance[ASCIISIZE];
    int first_appearance[ASCIISIZE];
    memset(last_appearance, 0 , sizeof(int) * ASCIISIZE);
    int len_s = (int) strlen(s);
    for (int i = 'a'; i <= 'z' ; i++) {
        first_appearance[i] = len_s;
    }
    for (int i = 0; i < len_s; i++) {
        last_appearance[s[i]] = i;
        first_appearance[s[len_s - i - 1]] = len_s - i - 1;
    }

    
    for (int i = 0; i < dSize; i++) {
        char *p_s = s + first_appearance[d[i][0]];
        char *p_d = d[i];
        while (p_s <= s + last_appearance[*p_d]  && *p_d) {
            if (*p_s == *p_d) {
                p_d++;
            }
            p_s++;
        }
        if (!(*p_d)) {
            if (strlen(result) < strlen(d[i]) || (strlen(result) == strlen(d[i]) && strcmp(result, d[i]) > 0)) {
                result = d[i];
            }
        }
    }
    return result;
}

char * findLongestWord4(char * s, char ** d, int dSize){
    char *result = "";
    if (s == NULL || strlen(s) < 1 || d == NULL || dSize < 1) {
        return result;
    }
    
    char *last_appearance[ASCIISIZE];
    char *first_appearance[ASCIISIZE];
    memset(last_appearance, 0 , sizeof(char *) * ASCIISIZE);
    int len_s = (int) strlen(s);
    for (int i = 'a'; i <= 'z' ; i++) {
        first_appearance[i] = s + len_s;
    }
    for (int i = 0; i < len_s; i++) {
        last_appearance[s[i]] = s + i;
        first_appearance[s[len_s - i - 1]] = s + len_s - i - 1;
    }

    
    for (int i = 0; i < dSize; i++) {
        char *p_s = first_appearance[d[i][0]];
        char *p_d = d[i];
        while (p_s <= last_appearance[*p_d]  && *p_d) {
            if (*p_s == *p_d) {
                p_d++;
            }
            p_s++;
        }
        if (!(*p_d)) {
            if (strlen(result) < strlen(d[i]) || (strlen(result) == strlen(d[i]) && strcmp(result, d[i]) > 0)) {
                result = d[i];
            }
        }
    }
    return result;
}

char * findLongestWord(char * s, char ** d, int dSize){
    char *result = "";
    if (s == NULL || strlen(s) < 1 || d == NULL || dSize < 1) {
        return result;
    }

    for (int i = 0; i < dSize; i++) {
        char *p_s = s;
        char *p_d = d[i];
        while (*p_s && *p_d) {
            if (*p_s == *p_d) {
                p_d++;
            }
            p_s++;
        }
        if (!(*p_d)) {  //s中找到d[i]
            if (strlen(result) < strlen(d[i]) || (strlen(result) == strlen(d[i]) && strcmp(result, d[i]) > 0)) {    // 如果“d[i]的长度> result” 或者 "d[i]的长度等于result，且d[i]的字典排序小于result"
                result = d[i];
            }
        }
    }
    return result;
}

int question524(){
    char *s = "abpcplea";
    char *str1 = "ale";
    char *str2 = "apple";
    char *str3 = "monkey";
    char *str4 = "plea";
    int size = 4;
    char *testStr[size];
    testStr[0] = str1;
    testStr[1] = str2;
    testStr[2] = str3;
    testStr[3] = str4;
    char *result = findLongestWord(s, testStr, size);
    printf("result of question524 is: %s\n", result);
    return 0;
}


/**
 fact：
 findLongestWord4、findLongestWord2、findLongestWord cost 32ms
 findLongestWord3 cost 56ms
 
 summarize：
 1, Optimization also cost time.
 */

