//
//  q0345.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0345.h"
#include "../common.h"

//345. Reverse Vowels of a String
//Easy
//426
//808
//
//Favorite
//
//Share
//Write a function that takes a string as input and reverse only the vowels of a string.
//
//Example 1:
//
//Input: "hello"
//Output: "holle"
//Example 2:
//
//Input: "leetcode"
//Output: "leotcede"
//Note:
//The vowels does not include the letter "y".
//
//
//
//Accepted
//169,913
//Submissions
//403,691
bool isVowels(char c){
    bool flag = false;
    switch (c) {
        case 'a':
            flag = true;
            break;
        case 'A':
            flag = true;
            break;
        case 'e':
            flag = true;
            break;
        case 'E':
            flag = true;
            break;
        case 'i':
            flag = true;
            break;
        case 'I':
            flag = true;
            break;
        case 'o':
            flag = true;
            break;
        case 'O':
            flag = true;
            break;
        case 'u':
            flag = true;
            break;
        case 'U':
            flag = true;
            break;
        default:
            break;
    }
    return flag;
}
// why heap-buffer-overflow?
//char * reverseVowels(char * s){
//    int len = (int) strlen(s);
//    if (len < 1) {
//        return s;
//    }
//    char *p_tail = s + len - 1;
//    char *p_head = s;
//    char *result = calloc(len, sizeof(char));
//    char *p_result = result;
//    while (*p_head != '\0') {
//        if (isVowels(*p_head)) {
//            while (!isVowels(*p_tail)) {
//                p_tail--;
//            }
//            *p_result++ = *p_tail--;
//        }else{
//            *p_result++ = *p_head;
//        }
//        p_head++;
//    }
//    return result;
//}

char * reverseVowels(char * s){
    int len = (int) strlen(s);
    if (len < 2) {
        return s;
    }
    char *p_tail = s + len - 1;
    char *p_head = s;
    
    char temp = ' ';
    while (p_head < p_tail) {
        bool head_flag = isVowels(*p_head);
        bool tail_flag = isVowels(*p_tail);
        if (head_flag && tail_flag) {
            temp = *p_head;
            *p_head = *p_tail;
            *p_tail = temp;
        }else if (head_flag){
            p_head--;
        }else if(tail_flag){
            p_tail++;
        }else{
        }
        p_head++;
        p_tail--;
    }
    return s;
}

int question345(){
    char s[] = "hello";
    printf("%s\n",s);
    char *result = reverseVowels(s);
    printf("%s\n",result);
    return 0;
}
