//
//  q0014.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0014.h"
#include "../common.h"

//14. Longest Common Prefix
//Easy
//968
//1052
//
//
//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
//Example 1:
//
//Input: ["flower","flow","flight"]
//Output: "fl"
//Example 2:
//
//Input: ["dog","racecar","car"]
//Output: ""
//Explanation: There is no common prefix among the input strings.

char* longestCommonPrefix(char** strs, int strsSize) {
    if (strsSize <= 0) {
        return "";
    }
    if (strsSize == 1) {
        return *strs;
    }
    
    size_t prefixSizeLen = strlen(*strs) + 1;
    char * const result = calloc(prefixSizeLen, sizeof(char));
    char *pResult = result;

//https://stackoverflow.com/questions/1143262/what-is-the-difference-between-const-int-const-int-const-and-int-const
//    int* - pointer to int
//    int const * - pointer to const int
//    int * const - const pointer to int
//    int const * const - const pointer to const int

//    Now the first const can be on either side of the type so:
//    const int * == int const *
//    const int * const == int const * const
//    If you want to go really crazy you can do things like this:
//
//        int ** - pointer to pointer to int
//        int ** const - a const pointer to a pointer to an int
//        int * const * - a pointer to a const pointer to an int
//        int const ** - a pointer to a pointer to a const int
//        int * const * const - a const pointer to a const pointer to an int
    
//    can't make pConstRecordPoint like char ** const
    char * pConstRecordPoint[strsSize];
    char **pToPConstRecordPoint = (char **)pConstRecordPoint;
    char **pToStrs = strs;
    for (int i = 0; i < strsSize; i++) {
        *pToPConstRecordPoint++ = *pToStrs++;
    }
    
    bool continueFlag = true;
    for (int i = 0;continueFlag && i < prefixSizeLen; i++) {
        pToPConstRecordPoint =  (char **)pConstRecordPoint;
        for (int j = 0; continueFlag && j < strsSize - 1; j++) {
            pToPConstRecordPoint++;
            if (**pToPConstRecordPoint == **pConstRecordPoint) {
                (*pToPConstRecordPoint)++;
            }else{
                continueFlag = false;
            }
        }
        pToPConstRecordPoint =  (char **)pConstRecordPoint;
        if (continueFlag) {
            *pResult++ = **pConstRecordPoint;
            (*pConstRecordPoint)++;
        }
    }
    return (char *)result;
}


int question14(){
//    char testStr[3][7] = {
//        {"flower"},
//        {"flow"},
//        {"flight"}};
    char *str1 = "flower";
    char *str2 = "flow";
    char *str3 = "flight";
    char *testStr[3];
    testStr[0] = str1;
    testStr[1] = str2;
    testStr[2] = str3;

    //    char **testStr = {&str1, &str2, &str3};
    printf("\n The longest common prefix is : %s \n",longestCommonPrefix((char **)testStr, 3));
    return 0;
}
