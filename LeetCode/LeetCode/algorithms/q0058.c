//
//  q0058.c
//  LeetCode
//
//  Created by NowOrNever on 29/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0058.h"
#include "../common.h"


//58. Length of Last Word
//Easy
//
//463
//
//1897
//
//Favorite
//
//Share
//Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
//
//If the last word does not exist, return 0.
//
//Note: A word is defined as a character sequence consists of non-space characters only.
//
//Example:
//
//Input: "Hello World"
//Output: 5
// 
//
//Accepted
//307,208
//Submissions
//950,242

//int lengthOfLastWord(char * s){
//    int len=strlen(s), lastLen=0;
//    for(int i=len-1; i>=0; i--){
//        if(s[i]-' '){lastLen++;}
//        else{if(lastLen){return lastLen;}}
//    }
//    return lastLen;
//}

int lengthOfLastWord(char * s){
    int result = 0;
    char *p = s + strlen(s) - 1;
    while (p >= s && *p ==' '){
        p--;
    }
    while (p >= s && *p !=' '){
        p--;
        result++;
    }
    return result;
}

int question58(void){
    return 0;
}
