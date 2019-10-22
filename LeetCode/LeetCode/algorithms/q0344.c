//
//  q0344.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0344.h"
#include "../common.h"

//344. Reverse String
//Easy
//852
//552
//
//Favorite
//
//Share
//Write a function that reverses a string. The input string is given as an array of characters char[].
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//You may assume all the characters consist of printable ascii characters.
//
//Example 1:
//
//Input: ["h","e","l","l","o"]
//Output: ["o","l","l","e","h"]
//Example 2:
//
//Input: ["H","a","n","n","a","h"]
//Output: ["h","a","n","n","a","H"]
//Accepted
//484,280
//Submissions
//757,501
void reverseString(char* s, int sSize){
    char *p_head = s;
    char *p_tail = s + sSize - 1;
    char temp = -1;
    while (p_head < p_tail) {
        temp = *p_head;
        *p_head = *p_tail;
        *p_tail = temp;
        p_head++;
        p_tail--;
    }
}

int question344(){
    char s[] = "this is a test";
    int size = sizeof(s) / sizeof(char);
    printf("%s\n",s);
    reverseString(s, size);
    printf("%s\n",s);
    return 0;
}
