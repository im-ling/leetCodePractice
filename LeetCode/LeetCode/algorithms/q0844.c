//
//  q0844.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0844.h"
#include "../common.h"

//844. Backspace String Compare
//Easy
//759
//49
//Favorite
//
//Share
//Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
//
//Example 1:
//
//Input: S = "ab#c", T = "ad#c"
//Output: true
//Explanation: Both S and T become "ac".
//Example 2:
//
//Input: S = "ab##", T = "c#d#"
//Output: true
//Explanation: Both S and T become "".
//Example 3:
//
//Input: S = "a##c", T = "#a#c"
//Output: true
//Explanation: Both S and T become "c".
//Example 4:
//
//Input: S = "a#c", T = "b"
//Output: false
//Explanation: S becomes "c" while T becomes "b".
//Note:
//
//1 <= S.length <= 200
//1 <= T.length <= 200
//S and T only contain lowercase letters and '#' characters.
//Follow up:
//
//Can you solve it in O(N) time and O(1) space?
//Accepted
//71,617
//Submissions
//153,867
//bool backspaceCompare(char * S, char * T){
//    int len1 = (int) strlen(S);
//    int len2 = (int) strlen(T);
//    char stackS1[len1];
//    char stackS2[len2];
//
//    int lenStackS1 = 0;
//    for (int i = 0; i < len1; i++) {
//        if (S[i] == '#') {
//            lenStackS1--;
//            if (lenStackS1 < 0) {
//                lenStackS1 = 0;
//            }
//        }else{
//            stackS1[lenStackS1++] = S[i];
//        }
//    }
//
//    int lenStackS2 = 0;
//    for (int i = 0; i < len2; i++) {
//        if (T[i] == '#') {
//            lenStackS2--;
//            if (lenStackS2 < 0) {
//                lenStackS2 = 0;
//            }
//        }else{
//            stackS2[lenStackS2++] = T[i];
//        }
//    }
//
//    if (lenStackS1 != lenStackS2) {
//        return false;
//    }
//    for (int i = 0; i < lenStackS1; i++) {
//        if (stackS1[i] != stackS2[i]) {
//            return false;
//        }
//    }
//    return true;
//}

//bool backspaceCompare(char * S, char * T){
//    int len1 = (int) strlen(S);
//    int len2 = (int) strlen(T);
//
//    int lenStackS1 = 0;
//    for (int i = 0; i < len1; i++) {
//        if (S[i] == '#') {
//            lenStackS1--;
//            if (lenStackS1 < 0) {
//                lenStackS1 = 0;
//            }
//        }else{
//            S[lenStackS1++] = S[i];
//        }
//    }
//
//    int lenStackS2 = 0;
//    for (int i = 0; i < len2; i++) {
//        if (T[i] == '#') {
//            lenStackS2--;
//            if (lenStackS2 < 0) {
//                lenStackS2 = 0;
//            }
//        }else{
//            T[lenStackS2++] = T[i];
//        }
//    }
//
//    if (lenStackS1 != lenStackS2) {
//        return false;
//    }
//    for (int i = 0; i < lenStackS1; i++) {
//        if (S[i] != T[i]) {
//            return false;
//        }
//    }
//    return true;
//}

bool backspaceCompare(char * S, char * T){
    int len1 = (int) strlen(S);
    int len2 = (int) strlen(T);
    
    char *p_tail_S = S + len1 - 1;
    char *p_tail_T = T + len2 - 1;
    int count_backspace_S = 0;
    int count_backspace_T = 0;
    
    while (p_tail_S >= S && p_tail_T >= T) {
        if (*p_tail_S == '#') {
            count_backspace_S++;
            p_tail_S--;
            continue;
        }else if (count_backspace_S) {
            count_backspace_S--;
            p_tail_S--;
            continue;
        }
        if (*p_tail_T == '#') {
            count_backspace_T++;
            p_tail_T--;
            continue;
        }else if (count_backspace_T) {
            count_backspace_T--;
            p_tail_T--;
            continue;
        }
        if (*p_tail_T != *p_tail_S) {
            return false;
        }
        p_tail_S--;
        p_tail_T--;
    }
    
    if (p_tail_T >= T) {
        while (p_tail_T >= T) {
            if (*p_tail_T == '#') {
                count_backspace_T++;
                p_tail_T--;
                continue;
            }else if (count_backspace_T) {
                count_backspace_T--;
                p_tail_T--;
                continue;
            }
            if (*p_tail_T) {
                return false;
            }
        }
    }

    if (p_tail_S >= S) {
        while (p_tail_S >= S) {
            if (*p_tail_S == '#') {
                count_backspace_S++;
                p_tail_S--;
                continue;
            }else if (count_backspace_S) {
                count_backspace_S--;
                p_tail_S--;
                continue;
            }
            if (*p_tail_S) {
                return false;
            }
        }
    }
    return true;
}

int question844(){
    char s1[] = "ad#c";
    char s2[] = "ab#c";
    int result = backspaceCompare(s1, s2);
    printf("%d \n",result);
    return 0;
}
