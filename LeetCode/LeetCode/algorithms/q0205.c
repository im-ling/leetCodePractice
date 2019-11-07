//
//  q0205.c
//  LeetCode
//
//  Created by NowOrNever on 08/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0205.h"
#include "../common.h"

//205. Isomorphic Strings
//Easy
//
//960
//
//279
//
//Favorite
//
//Share
//Given two strings s and t, determine if they are isomorphic.
//
//Two strings are isomorphic if the characters in s can be replaced to get t.
//
//All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
//
//Example 1:
//
//Input: s = "egg", t = "add"
//Output: true
//Example 2:
//
//Input: s = "foo", t = "bar"
//Output: false
//Example 3:
//
//Input: s = "paper", t = "title"
//Output: true
//Note:
//You may assume both s and t have the same length.
//
//Accepted
//240,930
//Submissions
//625,050

bool isIsomorphic(char * s, char * t){
    char ascii_map[128] = {0};
    int strlen_s = (int)(strlen(s) + 1);
    char str1[strlen_s];
    char str2[strlen_s];

    char index_c = 'a';
    memset(ascii_map, 0, sizeof(char) * 128);
    memset(str1, 0, sizeof(char) * strlen_s);
    for (int i = 0; i < strlen_s - 1; i++) {
        if (!ascii_map[s[i]]) {
            ascii_map[s[i]] = index_c;
            index_c++;
        }
        str1[i] = ascii_map[s[i]];
    }
    
    index_c = 'a';
    memset(ascii_map, 0, sizeof(char) * 128);
    memset(str2, 0, sizeof(char) * strlen_s);
    for (int i = 0; i < strlen_s - 1; i++) {
        if (!ascii_map[t[i]]) {
            ascii_map[t[i]] = index_c;
            index_c++;
        }
        str2[i] = ascii_map[t[i]];
    }
    printf("str1: %s\nstr2: %s\n", str1, str2);
    if (strcmp(str1, str2)) {
        return 0;
    }
    return 1;
}

int question205(){
    char *str1 = "foo";
    char *str2 = "bar";
    printf("result of quesiton 205: %d\n", isIsomorphic(str1, str2));
    return 0;
}
