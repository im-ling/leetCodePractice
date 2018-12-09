//
//  main.m
//  LeetCode
//
//  Created by DoubleL on 2018/11/22.
//  Copyright © 2018 DoubleL. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Extra.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, LeetCode!");
//        int question1(void);
//        question1();
//        int question2(void);
//        question2();
//        int question3(void);
//        question3();
//        int question4(void);
//        question4();
//        int question5(void);
//        question5();
//        int question6(void);
//        question6();
//        int question7(void);
//        question7();
//        int question8(void);
//        question8();
//        int question9(void);
//        question9();
//        dpExample();
//        googleEggDropProblem();
//        int question10(void);   //todo: dp done
//        question10();
//        int question11(void);
//        question11();
//        int question12(void);
//        question12();
//        int question13(void);
//        question13();
//        int question14(void);
//        question14();
//        int question15(void);
//        question15();
//        int question16(void);
//        question16();
//        int question17(void);
//        question17();
//        int question18(void);  // need imporve (16 ms, faster than 65.85%)
//        question18();
//        int question19(void);
//        question19();
//        int question20(void);
//        question20();
//        int question21(void);
//        question21();
//        int question22(void);
//        question22();
//        int question23(void);
//        question23();
//        int question24(void);
//        question24();
//        int question25(void);
//        question25();
//        int question26(void);
//        question26();
//        int question27(void);
//        question27();
//        int question28(void);
//        question28();
//        int question29(void);
//        question29();
//        int question31(void);
//        question31();
//        int question70(void);
//        question70();
    }
    return 0;
}

//Q1:Two Sum
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//Example:
//Given nums = [2, 7, 11, 15], target = 9,
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].

int question1(){
    printf("question1\n");
    int nums[] = {2, 7, 11, 15};
    int target = 9;
    //    int *result = NULL;
    int* twoSum(int* nums, int numsSize, int target);
    int *result = twoSum(nums, 4, target);
    printf("result = {%d , %d}",*result , * (result+1));
    return 0;
}
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target) {
    int *resultArray = malloc(sizeof(int) * 2);
    for(int i = 0; i < numsSize; i++){
        for (int j = i+1; j < numsSize; j++) {
            if (nums[i] == target - nums[j]) {
                *resultArray = i;
                *(resultArray+1) = j;
                return resultArray;
            }
        }
    }
    return resultArray;
}

//2. Add Two Numbers
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//Example:
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode {
    int val;
    struct ListNode *next;
};

struct ListNode* newNodeWith(struct ListNode* l1, struct ListNode* l2, int *carryFlag){
    struct ListNode *result = calloc(1, sizeof(struct ListNode));
    if (l1 && l2) {
        result->val = l1->val + l2->val + *carryFlag;
    }else if(l1){
        result->val = l1->val + *carryFlag;
    }else if (l2){
        result->val = l2->val + *carryFlag;
    }else{
        result->val = *carryFlag;
    }
    *carryFlag = result->val / 10;
    result->val = result->val % 10;
    return result;
}
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode *p1 = l1;
    struct ListNode *p2 = l2;
    struct ListNode *result = calloc(1, sizeof(struct ListNode));
    struct ListNode *tempResult = result;
    int carryFlag = 0;
    while (p1 != NULL || p2 != NULL || carryFlag != 0) {
        tempResult->next = newNodeWith(p1, p2, &carryFlag);
        tempResult = tempResult->next;
        if (p1) {
            p1 = p1->next;
        }
        if (p2) {
            p2 = p2->next;
        }
    }
    tempResult = result->next;
    free(result);
    return tempResult;
}
int question2(void){
    struct ListNode s11 = {3, NULL};
    struct ListNode s12 = {8, &s11};
    struct ListNode s13 = {1, &s12};
    
    struct ListNode s21 = {4, NULL};
    struct ListNode s22 = {6, &s21};
    struct ListNode s23 = {2, &s22};
    struct ListNode *result = addTwoNumbers(&s13, &s23);
    while (result) {
        printf(" %d ",result->val);
        result = result->next;
    }
    return 0;
}




//3. Longest Substring Without Repeating Characters
//Medium
//Given a string, find the length of the longest substring without repeating characters.
//Example 1:
//Input: "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.
//Example 2:
//Input: "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.
//Example 3:
//Input: "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


// my
//int findMaxString(char *s, int *max){
//    int charlist[128] = {0};
//    printf("sizeof charlist %lu",sizeof(charlist));
//    memset(charlist, 0, sizeof(charlist));
//    int result = 0;
//    char *p = s;
//    int continueFlag = 1;
//    while (*p != '\0' && continueFlag) {
//        if (charlist[*p] == 0) {
////            printf("can enter?");
//            result++;
//            charlist[*p] = result;
//        }else{
//            continueFlag = false;
//            break;
//        }
//        p++;
//    }
//    if(result > *max)
//        *max = result;
//    if (charlist[*p] == 0) {
//        return 1;
//    }
//    return charlist[*p];
//}
//
//int lengthOfLongestSubstring(char* s) {
//    char *p = s;
//    int max = 0;
//    while (NULL != p && *p != '\0') {
////        printf("\n max(%d) string(%s) %p",max,p,p);
//        p += findMaxString(p, &max);
//    }
//    return max;
//}

// one of the best answer
//思想：i为当前报数，j为之前重复的index的最大；i-j+1为当前值的无重复个数
int lengthOfLongestSubstring(char* s)
{
    int i,j=0;
    int length = (int)strlen(s);
    int ans = 0;
    int bucket[128];
    for (i=0;i<127;i++) bucket[i]=-1;
        if(length<=1) return length;

    for (i=0;i<length;i++){
        if (bucket[s[i]]<0) bucket[s[i]]=i;   //若标志位没置，说明没有使用过
        else{
            if (j<bucket[s[i]]+1) j=bucket[s[i]]+1; //j为重复值的上一个index，若出现重复值，然而其index不如j的话，那就没必要再更新j了，因为j的index已经重复了
            bucket[s[i]]=i;
        }
        if(i-j+1>ans) ans=i-j+1;
    }
    return ans;
}

int question3(){
    printf("maxleng : %d",lengthOfLongestSubstring("bacdefahijklmnokpb"));
    return 0;
};


//4. Median of Two Sorted Arrays
//Hard
//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//You may assume nums1 and nums2 cannot be both empty.
//Example 1:
//nums1 = [1, 3]
//nums2 = [2]
//The median is 2.0
//Example 2:
//nums1 = [1, 2]
//nums2 = [3, 4]
//The median is (2 + 3)/2 = 2.5
double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size) {
    double result = 0;
    int newNumberSize = nums1Size + nums2Size;
    int *newNumbers = malloc(sizeof(int) * newNumberSize);
    memset(newNumbers, 0, sizeof(int) * newNumberSize);
    int *p = newNumbers;
    int i = 0;
    int j = 0;
    while (i < nums1Size && j < nums2Size) {
        if (nums1[i] < nums2[j]) {
            *p++ = nums1[i++];
        }else{
            *p++ = nums2[j++];
        }
    }
    if (i >= nums1Size) {
        while (j < nums2Size) {
            *p++ = nums2[j++];
        }
    }else{
        while (i < nums1Size) {
            *p++ = nums1[i++];
        }
    }
    int index = newNumberSize / 2;
    if (newNumberSize % 2) {
        result = newNumbers[index];
    }else{
        result = newNumbers[index] + newNumbers[index - 1];
        result = result / 2.0;
    }
    free(newNumbers);
    return result;
}

int question4(){
    int nums1[] = {1, 2};
    int nums2[] = {3, 4};
    double result = findMedianSortedArrays(nums1, 2, nums2, 2);
    printf("meddlevalue %lf",result);
    return 0;
};

//5. Longest Palindromic Substring
//Medium
//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//Example 1:
//Input: "babad"
//Output: "bab"
//Note: "aba" is also a valid answer.
//Example 2:
//Input: "cbbd"
//Output: "bb"

int checkIsOddPalindrome(char *s, char *first, char *last, int *maxLength,char **target, bool *isOdd){
    char *pLeft = s - 1;
    char *pRight= s + 1;
    int result = 0;
    *isOdd = false;
    while (pLeft >= first && pRight <= last) {
        if (*pLeft == *pRight) {
            result++;
        }else{
            break;
        }
        pLeft--;
        pRight++;
    }
    if (result * 2 + 1 > *maxLength && result > 0) {
        *maxLength = result * 2 + 1;
        *target = s - result;
    }
    if (result > 0) {
        *isOdd = true;
    }
    return result;
}

int checkIsEvenPalindrome(char *s, char *first, char *last, int *maxLength,char **target, bool *isEven){
    char *pLeft = s;
    char *pRight= s + 1;
    int result = 0;
    *isEven = false;
    while (pLeft >= first && pRight <= last) {
        if (*pLeft == *pRight) {
            result++;
        }else{
            break;
        }
        pLeft--;
        pRight++;
    }
    if (result * 2 > *maxLength && result > 0) {
        *maxLength = result * 2;
        *target = s - result + 1;
    }
    if (result > 0) {
        *isEven = true;
    }
    return result;
}

char* longestPalindrome(char* s) {
    char *target = s;
    char *p = s;
    char *last = s + strlen(s);
    int maxLength = 0;
    
    bool isOdd = false;
    bool isEven = false;
    
//    int step;
//    int step1;
//    int step2;
    
    while (p>=s && p<= last) {
        printf("\ncurrent s(%s) target(%s) maxleng(%d)",p,target ,maxLength);
        checkIsOddPalindrome(p, s, last, &maxLength, &target, &isOdd);
        checkIsEvenPalindrome(p, s, last, &maxLength, &target, &isEven);
//        step = step1 > step2 ? step1 : step2;
//        p += step;
        p++;
    }
    if (maxLength == 0) {
        char *result = malloc(sizeof(char) * 2);
        *result = *s;
        *(result + 1) = '\0';
        return result;
    }
    char *result = malloc(sizeof(char) * (maxLength + 1));
    memset(result, 0, sizeof(char) * (maxLength + 1));
    memcpy(result, target, maxLength);
    result[maxLength] = '\0';
    return result;
}
int question5(){
    char *s = "aaaaa";
    printf("\nlongest %s",longestPalindrome(s));
    printf("\nfinished");
    return 0;
};



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



//7. Reverse Integer
//Easy
//1726
//2442
//Given a 32-bit signed integer, reverse digits of an integer.
//Example 1:
//Input: 123
//Output: 321
//Example 2:
//Input: -123
//Output: -321
//Example 3:
//Input: 120
//Output: 21
//Note:
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
int reverse(int x) {
    bool negativeFlag = x < 0 ? true : false;
    int64_t x_extension = x;
    if (negativeFlag) {
        x_extension = -x_extension;
    }
    int64_t result = 0;
    int cursor;
    while (x_extension != 0) {
        cursor = x_extension % 10;
        x_extension /= 10;
        result = result * 10 + cursor;
    }
    if (result > 2147483648 || (result > 2147483647 && negativeFlag)) {
        return 0;
    }
    if (negativeFlag) {
        result = -result;
    }
    return (int)result;
}
int question7(){
    int testNumber = -2147483648;
    printf("reverse number %d",reverse(testNumber));
    return 0;
};


//8. String to Integer (atoi)
//Medium
//679
//4530
//Implement atoi which converts a string to an integer.
//The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
//The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
//If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
//If no valid conversion could be performed, a zero value is returned.
//Note:
//Only the space character ' ' is considered as whitespace character.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
//Example 1:
//Input: "42"
//Output: 42
//Example 2:
//Input: "   -42"
//Output: -42
//Explanation: The first non-whitespace character is '-', which is the minus sign.
//Then take as many numerical digits as possible, which gets 42.
//Example 3:
//Input: "4193 with words"
//Output: 4193
//Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
//Example 4:
//Input: "words and 987"
//Output: 0
//Explanation: The first non-whitespace character is 'w', which is not a numerical
//digit or a +/- sign. Therefore no valid conversion could be performed.
//Example 5:
//Input: "-91283472332"
//Output: -2147483648
//Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
//Thefore INT_MIN (−231) is returned.
int myAtoi(char* str) {
    char *p = str;
    int64_t result = 0;
    char blankSpace = ' ';
    while (*p == blankSpace){   //deal with blankspace
        p++;
    };
    bool negativeFlag = false;  //deal with positive and negative flag
    if (*p == '-') {
        negativeFlag = true;
        p++;
    }else if (*p == '+'){
        p++;
    }
    while (*p == '0') {         //deal with initail zero
        p++;
    }
    for (int i = 0;*p >= '0' && *p <= '9' && i <= 10; i++,p++) {    //deal with result over max_int length
        result = result * 10 + (*p) - '0';
    }
    if (negativeFlag) {         // use negativeflag
        result = - result;
    }
    if (result > 2147483647) {      // deal with INT32_MAX
        result = 2147483647;
    }else if (result < -2147483648){ // deal with INT32_MIN
        result = -2147483648;
    }
    return (int)result;
}
int question8(){
//    "  0000000000012345678"
    char *testStr = "9223372036854775808";
    printf("myAtoi %d\n",myAtoi(testStr));
    return 0;
};

//9. Palindrome Number // i don't understand why it take so long?
//Easy
//1076
//1127
//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//Example 1:
//Input: 121
//Output: true
//Example 2:
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

// cool !
// https://leetcode.com/problems/palindrome-number/discuss/151381/C-Easy-to-understand-solution-without-string-(3-lines)
bool isPalindrome(int x) {
    if (x < 10) return (x >= 0);
    int y = 0;
    for(int x2 = x; x2; y = y*10 + (x2 % 10), x2 /= 10) {}
    return x==y;
}

//bool isPalindrome(int x) {
//    if (x < 0) {
//        return false;
//    }
//    char charsNumber[12];
//    memset(charsNumber, 0, 12);
//    char *p = charsNumber;
//    while ( x != 0) {
//        *p++ = x % 10 + '0';
//        x /= 10;
//    }
//    size_t len = strlen(charsNumber);
//    char *pLeft = charsNumber;
//    char *pRight = charsNumber + len - 1;
//    while (pLeft < pRight) {
//        if (*pLeft != *pRight) {
//            return false;
//        }
//        pLeft++;
//        pRight--;
//    }
//    return true;
//}

//bool isPalindrome(int x) {
//    if (x < 0) {
//        return false;
//    }
//    return x == reverse(x);
//}


int question9(){
//    11、121
    printf("isPalindrome %d\n",isPalindrome(12321));
    return 0;
};


//10. Regular Expression Matching
//Hard
//Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
//The matching should cover the entire input string (not partial).
//Note:
//s could be empty and contains only lowercase letters a-z.
//p could be empty and contains only lowercase letters a-z, and characters like . or *.
//Example 1:
//Input:
//s = "aa"
//p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
//Example 2:
//Input:
//s = "aa"
//p = "a*"
//Output: true
//Explanation: '*' means zero or more of the precedeng element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
//Example 3:
//Input:
//s = "ab"
//p = ".*"
//Output: true
//Explanation: ".*" means "zero or more (*) of any character (.)".
//Example 4:
//Input:
//s = "aab"
//p = "c*a*b"
//Output: true
//Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore it matches "aab".
//Example 5:
//Input:
//s = "mississippi"
//p = "mis*is*p*."
//Output: false



// first than fast than 13.61%  /(ㄒoㄒ)/~~
//bool isMatch(char* s, char* p) {
//    printf("\ns(%s) p(%s)",s,p);
//    size_t sLen = strlen(s);
//    size_t pLen = strlen(p);
//    if (sLen == 0 && pLen == 0) {
//        return true;
//    }else if(pLen == 0){
//        return false;
//    }
//    if (*(p+1) != '*') {
////        if (*p == '.' || *p == *s) {
////            return (sLen > 0 && isMatch(s+1, p+1));
////        }else{
////            return false;
////        }
//        return (sLen > 0) && (*p == '.' || *p == *s) && isMatch(s+1, p+1);
//    }else{
//        return (isMatch(s, p+2) || (sLen > 0 && (*s == *p || *p == '.') && isMatch(s+1, p)));
//    }
//}


// fast than 36%
//bool isMatch(char *s, char* p)
//{
////    printf("\ns(%s) p(%s)",s,p);
//    if(*p == '\0')
//        return *s=='\0';
//    if(*(p+1) == '*')
//        return isMatch(s, p+2) ||  //match zero letter in s;
//        (*s!='\0' && (*s==*p || '.'==*p) && isMatch(++s, p)); //match one or more;
//    else
//        return *s!='\0' && (*s==*p || '.'==*p) && isMatch(++s, ++p);
//}

//todo: dp solution
//dp solution done
bool isMatch(char *s, char* p)
{
    size_t sLen = strlen(s);
    size_t pLen = strlen(p);
    bool resultMap[sLen + 1][pLen + 1];
    memset(resultMap, 0, (sLen + 1) * (pLen + 1) * sizeof(bool));
    resultMap[0][0] = true;
    for (int i = 0; i <= sLen; i++) {
        for (int j = 1; j <= pLen; j++) {
            if (p[j - 1] == '*') {
                resultMap[i][j] = resultMap[i][j - 2] || (i > 0 && resultMap[i - 1][j] && (p[j - 2] == '.' || p[j - 2] == s[i - 1]));
            }else{
                resultMap[i][j] = i > 0 && resultMap[i - 1][j - 1] && (p[j - 1] == '.' || p[j - 1] == s[i - 1]);
            }
        }
    }
    
//    for (int i = 0; i <= sLen; i++) {
//        printf("\n");
//        for (int j = 0; j <= pLen; j++) {
//            printf(" %d",resultMap[i][j]);
//        }
//    }
//    printf("\n");
    return resultMap[sLen][pLen];
}

//
int question10(){
    char *str =
//    "bbbba";
//    "aab";
    "aa";
//    char *pattern = "b.*c";
    char *pattern =
//    ".*a*a";
//    "c*a*b";
    "a";
    //    11、121
    printf("isMatch %d\n",isMatch(str, pattern));
    return 0;
};



//11. Container With Most Water
//Medium
//2260
//386
//Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//Note: You may not slant the container and n is at least 2.
//
//The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
//
//Example:
//
//Input: [1,8,6,2,5,4,8,3,7]
//Output: 49

#define MIN_AB( a, b) ( (a) < (b) ? (a) : (b) )
//int maxArea(int* height, int heightSize) {
//    int max = 0;
//    int current = 0;
//    for (int i = 0; i < heightSize; i++) {
//        for (int j = i + 1; j < heightSize; j++) {
//            current = MIN_AB(height[i], height[j]) * (j - i);
//            if (current > max) {
//                max = current;
//            }
//        }
//    }
//    return max;
//}

//skip lower height
int maxArea(int* height, int heightSize) {
    long max = 0;
    long current = 0;
    int currentHeight = 0;

    int *pLeft = height;
    int *pRight= height + heightSize - 1;
    while (pLeft < pRight) {
        currentHeight = MIN_AB(*pLeft, *pRight);
        current = currentHeight * (pRight - pLeft);
        if (current > max) {
            max = current;
        }
        while (*pLeft  <= currentHeight && pLeft < pRight) {
            pLeft++;
        }
        while (*pRight <= currentHeight && pLeft < pRight) {
            pRight--;
        }
    }
    return (int)max;
}

//
//int maxArea(int* heights, int n) {
//    int water = 0, *i = heights, *j = i + n - 1;
//    while (i < j) {
//        int h = *i < *j ? *i : *j;
//        int w = (j - i) * h;
//        if (w > water) water = w;
//        while (*i <= h && i < j) i++;
//        while (*j <= h && i < j) j--;
//    }
//    return water;
//}
int question11(){
//    int testHeights[9] = {1,8,6,2,5,4,8,3,7};
    int testHeights[4] = {1,9,9,1};
    printf("maxArea %d \n",maxArea(testHeights, 4));
    return 0;
};


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


//13. Roman to Integer
//Easy
//945
//2210
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
//Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
//
//Example 1:
//
//Input: "III"
//Output: 3
//Example 2:
//
//Input: "IV"
//Output: 4
//Example 3:
//
//Input: "IX"
//Output: 9
//Example 4:
//
//Input: "LVIII"
//Output: 58
//Explanation: L = 50, V= 5, III = 3.
//Example 5:
//
//Input: "MCMXCIV"
//Output: 1994
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

#define RomanToIntMaxFactor 1000
int romanToInt(char* s) {
    int result = 0;
    int factor = RomanToIntMaxFactor;
    char romanNumbers[10] = "**MDCLXVI";
    char *ps = s;
    char *pRomanNumber = romanNumbers;
    
    while (factor > 0 && *ps !='\0') {
        char max = *pRomanNumber++;
        char middle = *pRomanNumber++;
        char min = *pRomanNumber;
        //        printf("\n currentRestult(%d) s(%s) max(%c) middle(%c) min(%c)", result, ps, max, middle, min);
        if (*(++ps) == max) {
            result += factor * 9;
            ps++;
        }else if (*(ps) == middle){
            result += factor * 4;
            ps++;
        }else{
            ps--;
            if (*ps == middle) {
                result += factor * 5;
                ps++;
            }
            while (*ps == min) {
                result += factor;
                ps++;
            }
        }
        factor /= 10;
    }
    return result;
}
int question13(){
    char testStr[] =
//    "III";
//    "IV";
//    "IX";
//    "LVIII";
//    "MCMXCIV";
    "MMMCCXX";
    printf("\nresult: %d\n",romanToInt(testStr));
    return 0;
}

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


//15. 3Sum
//Medium
//2739
//310
//
//
//Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note:
//
//The solution set must not contain duplicate triplets.
//
//Example:
//
//Given array nums = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
// [-1, 0, 1],
// [-1, -1, 2]
//]

/**
 * Return an array of arrays of size *returnSize.
 * Note: The returned array must be malloced, assume caller calls free().
 */

//int compareIntFunction(const void *a, const void *b){
//    int aValue = *((int*)a);
//    int bVaule = *((int*)b);
//    if (aValue > bVaule) {
//        return 1;
//    }else if (aValue < bVaule){
//        return -1;
//    }else{
//        return 0;
//    }
//}
int compareIntFunction(const void *a, const void *b){
    return *(int *)a - *(int *)b;
}

int** threeSum(int* nums, int numsSize, int* returnSize) {
    int bufferSize = 100;
    int **result = calloc(bufferSize, sizeof(int *));
    int resultCount = 0;

    if (numsSize < 3) {
        *returnSize = 0;
        return result;
    }
    
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    
    for (int i = 0; i < numsSize ; i++) {
        // handle duplicates i
        if (nums[i] > 0) {
            break;
        }
        while (i > 0 && nums[i] == nums[i - 1]) {
            i++;
        }
        int pStart = i + 1;
        int pEnd = numsSize - 1;
        int sum = INT32_MAX;
        
        while (pStart < pEnd) {
            sum = nums[i] + nums[pStart] + nums[pEnd];
            if (sum > 0) {
                pEnd--;
//                while (nums[pEnd] == nums[pEnd + 1]) {
//                    pEnd--;
//                }
            }else if(sum < 0){
                pStart++;
//                while (nums[pStart] == nums[pStart - 1]) {
//                    pStart++;
//                }
            }else{
//                printf("\n rescount(%d) i(%d) start(%d) end(%d)", resultCount, i, pStart, pEnd);
                if (resultCount >= bufferSize) {
                    bufferSize += bufferSize;
                    result = realloc(result, sizeof(int *) * bufferSize);
                }
                int *newNode = calloc(1, sizeof(int) * 3);
                newNode[0] = nums[i];
                newNode[1] = nums[pStart];
                newNode[2] = nums[pEnd];
                result[resultCount++] = newNode;
                pStart++;
                while (pStart < pEnd && nums[pStart] == nums[pStart - 1]) {
                    pStart++;
                }
                pEnd--;
                while (pStart < pEnd && nums[pEnd] == nums[pEnd + 1]) {
                    pEnd--;
                }
            }
        }
        
    }
    *returnSize = resultCount;
    return result;
}

int question15(){
    int numbers[] =
//    {0,0,0,0};
//    {-1, 0, 1, 2, -1, -4};
//    {-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0};
    {-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6};
    int resultSize = 0;
    double timeBefore = [[NSDate date] timeIntervalSince1970];
    int **result = threeSum(numbers, sizeof(numbers) / sizeof(int), &resultSize);
    printf("\n timeSpend %lf resultCount(%d)",[[NSDate date] timeIntervalSince1970] - timeBefore, resultSize);
//    for (int i = 0; i < resultSize; i++) {
//        printf("\n i(%d) %d %d %d",i,result[i][0],result[i][1],result[i][2]);
//    }
//    [[-5,1,4],[-4,0,4],[-4,1,3],[-2,-2,4],[-2,1,1],[0,0,0]]
    printf("\n");
    return 0;
}


//16. 3Sum Closest
//Medium
//757
//58
//Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//Example:
//
//Given array nums = [-1, 2, 1, -4], and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).



int threeSumClosest(int* nums, int numsSize, int target){
    if (numsSize < 3) {
        return 0;
    }
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    int result = INT32_MAX;
    int rangeClose  = INT32_MAX;
    int indexLeft = 0;
    int indexMiddle  = 0;
    int indexRight = 0;

    int current = 0;
    int currentRange = INT32_MAX;

    for (indexLeft = 0; indexLeft < numsSize - 2 ; indexLeft++) {
        indexMiddle = indexLeft+1;
        indexRight = numsSize - 1;
        while (indexMiddle < indexRight) {
            current = nums[indexLeft] + nums[indexMiddle] + nums[indexRight];
            if (current == target) {
                return target;
            }else if (current < target){
                indexMiddle++;
                currentRange = target - current;
            }else{
                currentRange = current - target;
                indexRight--;
            }
            if (currentRange < rangeClose) {
                rangeClose = currentRange;
                result = current;
            }
        }
    }
    return result;
}


//int threeSumClosest(int* nums, int numsSize, int target) {
//    if (numsSize < 3) {
//        return 0;
//    }
//    qsort(nums, numsSize, sizeof(int), compareFunction);
////    for (int i = 0; i < numsSize; i++) {
////        printf(" %d ",nums[i]);
////    }
//    int range = INT32_MAX;
//    int closest = INT32_MAX;
//    int current = 0;
//    for (int i = 0; i < numsSize;) {
//        for (int j = i + 1; j < numsSize;) {
//            for (int k = j + 1; k < numsSize;) {
//                current = nums[i] + nums[j] + nums[k];
////                printf("\n %d %d %d current %d abs(%d) range(%d)", nums[i], nums[j], nums[k],current, abs(target - current),range);
//                if (current == target) {
//                    return target;
//                }else if (range > abs(target - current)){
//                    closest = current;
//                    range = abs(target - current);
////                    k = numsSize;
//                }
//                int kValue = nums[k];
//                while (nums[++k] <= kValue) {
//                }
//            }
//            int jValue = nums[j];
//            while (nums[++j] <= jValue) {
//            }
//        }
//        int iValue = nums[i];
//        while (nums[++i] <= iValue) {
//        }
//
//    }
//    return closest;
//}
int question16(){
    int nums[] =
//    {-1, 2, 1, -4};
    {1,1,-1,-1,3};
    printf("\n ThreeSumClosest is : %d \n",threeSumClosest(nums, 5, 3));
    return 0;
}


//17. Letter Combinations of a Phone Number
//Medium
//1625
//229
//
//
//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//
//
//Example:
//
//Input: "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//Note:
//
//Although the above answer is in lexicographical order, your answer could be in any order you want.
/**
 * Return an array of size *returnSize.
 * Note: The returned array must be malloced, assume caller calls free().
 */

int findAResult(char *** result, int *resultCount, int *bufferSize, char *currentChar,char *oneAnswer, char *answerPosition){
    int loopCount = 3;
    char firstChar = '\0';
    switch (*currentChar) {
        case '\0':{
            if (*resultCount >= *bufferSize) {
                *bufferSize += *bufferSize;
//                printf("\n expandBuffer %lu", sizeof(char *) * (*bufferSize));
                *result = realloc(*result,(*bufferSize) * sizeof(char *));
            }
            long len = answerPosition - oneAnswer;
            char *oneNode = calloc(len + 1, sizeof(char));
            memcpy(oneNode, oneAnswer,len);
            (*result)[*resultCount] = oneNode;
            (*resultCount)++;
            return 0;
        }
        case '1':{
            loopCount = 0;
        }
            break;
        case '2':{
            firstChar = 'a';
        }
            break;
        case '3':{
            firstChar = 'd';
        }
            break;
        case '4':{
            firstChar = 'g';
        }
            break;
        case '5':{
            firstChar = 'j';
        }
            break;
        case '6':{
            firstChar = 'm';
        }
            break;
        case '7':{
            firstChar = 'p';
            loopCount++;
        }
            break;
        case '8':{
            firstChar = 't';
        }
            break;
        case '9':{
            loopCount++;
            firstChar = 'w';
        }
            break;
        default:
            break;
    }
    currentChar++;
    for (int i = 0; i < loopCount; i++) {
        *answerPosition = firstChar + i;
        findAResult(result, resultCount, bufferSize, currentChar, oneAnswer, answerPosition + 1);
    }
    return 0;
}

char** letterCombinations(char* digits, int* returnSize) {
    int bufferSize = 100;
    size_t strLen = strlen(digits) + 1;
    
    char *digitsAfterOptimize = calloc(strLen, sizeof(char));
    char *p = digitsAfterOptimize;
    while (*digits != '\0') {
        *p++ = *digits++;
    }
    strLen = strlen(digitsAfterOptimize) + 1;
    if (strLen <= 1) {
        return NULL;
    }
    
    char **result = calloc(bufferSize, sizeof(char *));
    char *oneAnswer = calloc(strLen, sizeof(char));
    findAResult(&result, returnSize, &bufferSize, digitsAfterOptimize, oneAnswer, oneAnswer);
    return result;
}

int question17(){
    char *digits =
//    "23";
    "5678";
    int resultCount = 0;
    char **result = letterCombinations(digits, &resultCount);
    for (int i = 0; i < resultCount; i++) {
        printf("\n i(%d) %s", i, result[i]);
    }
    printf("\n");
    return 0;
}



//18. 4Sum
//Medium
//754
//146
//
//
//Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
//
//Note:
//
//The solution set must not contain duplicate quadruplets.
//
//Example:
//
//Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
//
//A solution set is:
//[
// [-1,  0, 0, 1],
// [-2, -1, 1, 2],
// [-2,  0, 0, 2]
// ]

int** fourSum(int* nums, int numsSize, int target, int* returnSize) {

    int bufferSize = 100;
    int **result = calloc(bufferSize, sizeof(int *));
    int resultCount = 0;
    
    if (numsSize < 4) {
        *returnSize = 0;
        return result;
    }
    
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    
//    for (int i = 0; i < numsSize; i++) {
//        printf(" %d ",nums[i]);
//    }
    
    for (int i = 0; i < numsSize ; i++) {
        // handle duplicates i
        while (i > 0 && nums[i] == nums[i - 1]) {
            i++;
        }
        
        for (int j = i + 1; j < numsSize; j++) {
            while (j > i + 1 && nums[j] == nums[j - 1]) {
                j++;
            }
            int pStart = j + 1;
            int pEnd = numsSize - 1;
            int sum = INT32_MAX;
            
            while (pStart < pEnd) {
                sum = nums[i] + nums[j] + nums[pStart] + nums[pEnd];
                if (sum > target) {
                    pEnd--;
                    //                while (nums[pEnd] == nums[pEnd + 1]) {
                    //                    pEnd--;
                    //                }
                }else if(sum < target){
                    pStart++;
                    //                while (nums[pStart] == nums[pStart - 1]) {
                    //                    pStart++;
                    //                }
                }else{
                    //                printf("\n rescount(%d) i(%d) start(%d) end(%d)", resultCount, i, pStart, pEnd);
                    if (resultCount >= bufferSize) {
                        bufferSize += bufferSize;
                        result = realloc(result, sizeof(int *) * bufferSize);
                    }
                    int *newNode = calloc(1, sizeof(int) * 4);
                    newNode[0] = nums[i];
                    newNode[1] = nums[j];
                    newNode[2] = nums[pStart];
                    newNode[3] = nums[pEnd];
                    
                    result[resultCount++] = newNode;
                    pStart++;
                    while (pStart < pEnd && nums[pStart] == nums[pStart - 1]) {
                        pStart++;
                    }
                    pEnd--;
                    while (pStart < pEnd && nums[pEnd] == nums[pEnd + 1]) {
                        pEnd--;
                    }
                }
            }
        }
    }
    *returnSize = resultCount;
    return result;
}
int question18(){
    int numbers[] =
    //    {0,0,0,0};
    //    {-1, 0, 1, 2, -1, -4};
    //    {-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0};
//    {1, 0, -1, 0, -2, 2};
//    {0,4,-5,2,-2,4,2,-1,4};
    {1,-2,-5,-4,-3,3,3,5};
    int resultSize = 0;
    double timeBefore = [[NSDate date] timeIntervalSince1970];
    int **result = fourSum(numbers, sizeof(numbers) / sizeof(int), -11, &resultSize);
    printf("\n timeSpend %lf resultCount(%d)",[[NSDate date] timeIntervalSince1970] - timeBefore, resultSize);
    for (int i = 0; i < resultSize; i++) {
        printf("\n i(%d) %d %d %d %d",i,result[i][0],result[i][1],result[i][2], result[i][3]);
    }
    printf("\n");
    return 0;
}


//19. Remove Nth Node From End of List
//Medium
//1337
//105
//
//
//Given a linked list, remove the n-th node from the end of list and return its head.
//
//Example:
//
//Given linked list: 1->2->3->4->5, and n = 2.
//
//After removing the second node from the end, the linked list becomes 1->2->3->5.
//Note:
//
//Given n will always be valid.
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* removeNthFromEnd(struct ListNode* head, int n) {
    struct ListNode *p = head;
    struct ListNode headNode = {0, NULL};
    headNode.next = head;
    struct ListNode *pOperateNode = &headNode;
    int threshold = n - 1;
    int count = 0;
    while (p->next != NULL) {
        p = p->next;
        if (++count > threshold) {
            pOperateNode = pOperateNode->next;
        }
        if (count == threshold) {
            pOperateNode->next = head;
        }
    }
//    printf("\noperationNodeValue %d",pOperateNode->val);
    struct ListNode *pRecycleNode = pOperateNode->next;
//    printf("recycleNode value %d",pRecycleNode->val);
    if (pOperateNode->next == head) {
        //        printf("\n pOperateNode->next->value %d",pOperateNode->next->val);
        head = head->next;
    }
    pOperateNode->next = pOperateNode->next->next;
    free(pRecycleNode);
    return head;
}

int question19(){
    int listLen = 5;
    struct ListNode headNode = {0, NULL};
    struct ListNode *head =  &headNode;
    for (int i = listLen; i > 0; i--) {
        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
        newNode->val = i;
        newNode->next = head->next;
        head->next = newNode;
    }
    head = head->next;
    struct ListNode *pHead = head;
    for (int i = 0; i < listLen; i++) {
        printf(" %d ",pHead->val);
        pHead = pHead->next;
    }
    head = removeNthFromEnd(head, 5);
    printf("\n");
    for (int i = 0; i < listLen - 1; i++) {
        printf(" %d ",head->val);
        head = head->next;
    }
    return 0;
}

//20. Valid Parentheses
//Easy
//2257
//107
//
//
//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Note that an empty string is also considered valid.
//
//Example 1:
//
//Input: "()"
//Output: true
//Example 2:
//
//Input: "()[]{}"
//Output: true
//Example 3:
//
//Input: "(]"
//Output: false
//Example 4:
//
//Input: "([)]"
//Output: false
//Example 5:
//
//Input: "{[]}"
//Output: true
bool isValid(char* s) {
    char *p = s;
    size_t strLen = strlen(s);
    if (strLen % 2) {
        return false;
    }else if (!strLen){
        return true;
    }
    char brackets[strLen];
    //    memset(brackets, 0, strLen * sizeof(char));
    char *index = brackets;
    while (*p != '\0') {
        switch (*p) {
            case 40:
                *index++ = 40;
                break;
            case 41:
                if ((--index) < brackets || *index != 40) {
                    return false;
                }
                break;
            case 91:
                *index++ = 91;
                break;
            case 93:
                if ((--index) < brackets || *index != 91) {
                    return false;
                }
                break;
            case 123:
                *index++ = 123;
                break;
            case 125:
                if ((--index) < brackets || *index != 123) {
                    return false;
                }
                break;
            default:
                break;
        }
        p++;
    }
    if (index != brackets) {
        return false;
    }
    return true;
}
int question20(){
    char *testStr = "()[]{}";
    printf("result %d\n",isValid(testStr));
    return 0;
}


//21. Merge Two Sorted Lists
//Easy
//1649
//225
//
//
//Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Example:
//
//Input: 1->2->4, 1->3->4
//Output: 1->1->2->3->4->4


//struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
//    struct ListNode *p1 = l1;
//    struct ListNode *p2 = l2;
//    struct ListNode *result = calloc(1, sizeof(struct ListNode));
//    struct ListNode *pResult = result;
//
//    while (p1 != NULL && p2 != NULL) {
//        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
//        if (p1->val < p2->val) {
//            newNode->val = p1->val;
//            pResult->next = p1;
//            p1 = p1->next;
//        }else{
//            newNode->val = p2->val;
//            pResult->next = p2;
//            p2 = p2->next;
//        }
//        pResult = pResult->next;
//    }
//
//    if (p1 == NULL) {
//        p1 = p2;
//    }
//    while (p1 != NULL) {
//        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
//        newNode->val = p1->val;
//        pResult->next = p1;
//        pResult = pResult->next;
//        p1 = p1->next;
//    }
//
//    pResult = result;
//    result = result->next;
//    free(pResult);
//    return result;
//}


//struct ListNode {
//    int val;
//    struct ListNode *next;
//};
struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
    if (l1 == NULL) {
        return l2;
    }else if (l2 == NULL){
        return l1;
    }else if (l1->val < l2->val){
        l1->next = mergeTwoLists(l1->next, l2);
        return l1;
    }else{
        l2->next = mergeTwoLists(l1, l2->next);
        return l2;
    }
}



int question21(){
    int listSize = 4;
    struct ListNode *p1;
    struct ListNode *p2;
    struct ListNode head1 = {0 ,NULL};
    struct ListNode head2 = {0, NULL};
    p1 = &head1;
    p2 = &head2;
//    printf("\n %d  p1(%p) p1->next(%p)",p1->val, p1, p1->next);
    for (int i = 0; i < listSize; i++) {
//        error 栈空间非动态分配内存，会释放
//        struct ListNode newNode1 = {i , NULL};
//        struct ListNode newNode2 = {i * 2, NULL};
        p1->next = calloc(1, sizeof(struct ListNode));
        p1->next->val = i;
        p1 = p1->next;
//        printf("\n %d  p1(%p) p1->next(%p)",p1->val, p1, p1->next);
        
        p2->next = calloc(1, sizeof(struct ListNode));
        p2->next->val = i * 2;
        p2 = p2->next;
    }
//    p1 = head1.next;
//    while (p1 != NULL) {
//        printf(" %d ", p1->val);
//        p1 = p1->next;
//    }
    struct ListNode* result = mergeTwoLists(head1.next, head2.next);
    while (result->next != NULL) {
        printf(" %d ", result->val);
        result = result->next;
    }
    return 0;
}

//22. Generate Parentheses
//Medium
//1994
//128
//
//
//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
// "((()))",
// "(()())",
// "(())()",
// "()(())",
// "()()()"
// ]

/**
 * Return an array of size *returnSize.
 * Note: The returned array must be malloced, assume caller calls free().
 */

int q22FillABlank(char ***result, int *bufferSize, int *resultCount, int balance, int lack, char *answer, char *pAnswer, int copyLen){
    if (lack == 0) {
        if (balance) {
            return -1;
        }else{
            if (*resultCount >= *bufferSize) {
                *bufferSize += *bufferSize;
                *result = realloc(*result, sizeof(char *) * (*bufferSize));
            }
            (*result)[*resultCount] = calloc(copyLen, sizeof(char));
            memcpy((*result)[*resultCount], answer, copyLen);
            (*resultCount)++;
            return 0;
        }
    }else{
        *pAnswer = '(';
        q22FillABlank(result, bufferSize, resultCount, balance - 1, lack - 1, answer, pAnswer + 1, copyLen);
        if (balance < 0) {
            *pAnswer = ')';
            q22FillABlank(result, bufferSize, resultCount, balance + 1, lack - 1, answer, pAnswer + 1, copyLen);
        }
    }
    return 0;
}

char** generateParenthesis(int n, int* returnSize) {
    int bufferSize = 100;
    char **result = calloc(bufferSize, sizeof(char *));
    if (n <= 0) {
        *result = calloc(2, sizeof(char));
        *returnSize = 1;
        return result;
    }
    char *answer = calloc(n * 2 + 1, sizeof(char));
    q22FillABlank(&result, &bufferSize, returnSize, 0, n * 2, answer, answer, n * 2);
    return result;
}
int question22(){
    int n = 3;
    int returnSize = 0;
    char **result = generateParenthesis(n, &returnSize);
    for (int i = 0; i < returnSize; i++) {
        printf("\n %s ",result[i]);
    }
    printf("\n");
    return 0;
}




//23. Merge k Sorted Lists
//Hard
//1746
//114
//
//
//Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
//
//Example:
//
//Input:
//[
// 1->4->5,
// 1->3->4,
// 2->6
// ]
//Output: 1->1->2->3->4->4->5->6

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

int printList(struct ListNode* list){
    printf("\n printLists:");
    int count = 0;
    while (list != NULL) {
        if (count++ %5 == 0) {
            printf("\n");
        }
        printf(" %d",list->val);
        list = list->next;
    }
    return 0;
}
int printTwoDimensionLists(struct ListNode** lists, int listsSize){
    printf("\n printTwoDimensionLists:");
    for (int i = 0; i < listsSize; i++) {
        printf("\n i(%d)",i);
        struct ListNode* p = lists[i];
        while (p != NULL) {
            printf(" %d",p->val);
            p = p->next;
        }
    }
    return 0;
}
struct ListNode* intArrayToList(int *array, int number){
    struct ListNode* result = calloc(1, sizeof(struct ListNode));
    struct ListNode* p = result;
    for (int i = 0; i < number; i++) {
        p->next = calloc(1, sizeof(struct ListNode));
        p->next->val = array[i];
        p = p->next;
    }
    p = result;
    result = result->next;
    free(p);
    return result;
}

//// 68 ms, faster than 63.11%
//struct ListNode* mergeKLists(struct ListNode** lists, int listsSize) {
//    struct ListNode *result = calloc(1, sizeof(struct ListNode));
//    struct ListNode *p = result;
////    struct ListNode *pTmp = NULL;
//    int indexMin = 0;
//    int min = INT32_MAX;
//    int secondMin = INT32_MAX;
//    while (listsSize > 0) {
//        bool findFlag = false;
//        for (int i = 0; i < listsSize; i++) {
//            if (lists[i] == NULL) {
//                if (listsSize <= 1) {
//                    listsSize--;
//                }else{
//                    lists[i] = lists[--listsSize];
//                }
//                i--;
//            }else if (min > lists[i]->val){
//                    findFlag = true;
//                    indexMin = i;
//                    secondMin = min;
//                    min = lists[i]->val;
//            }else if(secondMin > lists[i]->val){
//                secondMin = lists[i]->val;
//            }
//        }
//        if (findFlag) {
//            p->next = lists[indexMin];
////            printf("\n i(%d) val(%d) ", indexMin, p->val);
//            p = p->next;
//            lists[indexMin] = lists[indexMin]->next;
//            while (lists[indexMin] && secondMin != INT32_MAX && lists[indexMin]->val < secondMin) {
//                p = lists[indexMin];
//                lists[indexMin] = lists[indexMin]->next;
//            }
//            min = INT32_MAX;
//            secondMin = INT32_MAX;
//            findFlag = false;
//        }
////        printTwoDimensionLists(lists, listsSize);
////        printList(result->next);
//    }
//    p = result;
//    result = result->next;
//    free(p);
//    return result;
//}

// 148 ms why it takes so long ?
//struct ListNode *mergeKLists(struct ListNode **lists, int listsSize) {
//    if (listsSize == 0)  {
//        return NULL;
//    }
//    if (listsSize == 1)   {
//        return lists[0];
//    }
//    for (int i = listsSize - 1; i > 0; i--) {
//        lists[0] = mergeTwoLists(lists[0], lists[i]);
//    }
//    return lists[0];
//}

////8 ms !!!
struct ListNode *mergeKLists(struct ListNode **lists, int listsSize) {
    if (listsSize == 0)  {
        return NULL;
    }
    if (listsSize == 1)   {
        return lists[0];
    }
    for (int i = 0,j = listsSize - 1; i < j; i++, j--) {
        lists[i] = mergeTwoLists(lists[i], lists[j]);
        listsSize--;
    }
    return mergeKLists(lists, listsSize);
}

int question23(){
    int listSize = 3;
    struct ListNode** lists = calloc(listSize, sizeof(struct ListNode*));
    int array[3][4] = {{3,1,4,5},{3,1,3,4},{2,2,6}};;
    for (int i = 0; i < 3; i++) {
        lists[i] = intArrayToList(array[i] + 1, array[i][0]);
//        printList(lists[i]);
    }
    printTwoDimensionLists(lists,listSize);
//    for (int i = 0; i < listSize; i++) {
//        lists[i] = calloc(1, sizeof(struct ListNode));
//        struct ListNode *p = lists[i];
//        printf("\n");
//        printf(" %d ",p->val);
//        for (int j = 0; j < listSize - 1; j++) {
//            p->next = calloc(1, sizeof(struct ListNode));
//            p->next->val = j * listSize + i;
//            printf(" %d ",p->next->val);
//            p = p->next;
//        }
//    }
//
//    printf("\n result:");
//    for (int i = 0; i < listSize; i++) {
//        struct ListNode *p = lists[i];
//        printf("\n i(%d) ",i);
//        while (p != NULL) {
//            printf(" %d ", p->val);
//            p = p->next;
//        }
//    }

    struct ListNode* result = mergeKLists(lists, listSize);
    printf("\nresult\n");
    printList(result);
    
    return 0;
}

//24. Swap Nodes in Pairs
//Medium
//789
//65
//
//
//Given a linked list, swap every two adjacent nodes and return its head.
//
//Example:
//
//Given 1->2->3->4, you should return the list as 2->1->4->3.
//Note:
//
//Your algorithm should use only constant extra space.
//You may not modify the values in the list's nodes, only nodes itself may be changed.
struct ListNode* swapPairs(struct ListNode* head) {
    if (head == NULL || head->next == NULL) {
        return head;
    }
    struct ListNode *result = head->next;
    struct ListNode *p = head;
    struct ListNode *tmpNode = NULL;
    struct ListNode *pLast = NULL;
    while (p != NULL && p->next != NULL) {
//        printList(p);
        if (pLast) {
            pLast->next = p->next;
        }
        tmpNode = p->next->next;
        p->next->next = p;
        p->next = tmpNode;
        pLast = p;
        p = p->next;
    }
    return result;
}

int question24(){
    int testArray[] = {1,2,3,4,5,6,7};
    struct ListNode *test = intArrayToList(testArray, 7);
    struct ListNode *result = swapPairs(test);
    printList(result);
    return 0;
}

//25. Reverse Nodes in k-Group
//Hard
//808
//182
//
//
//Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
//
//k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
//
//Example:
//
//Given this linked list: 1->2->3->4->5
//
//For k = 2, you should return: 2->1->4->3->5
//
//For k = 3, you should return: 3->2->1->4->5
//
//Note:
//
//Only constant extra memory is allowed.
//You may not alter the values in the list's nodes, only nodes itself may be changed.
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseKGroup(struct ListNode* head, int k) {
    if (head == NULL) {
        return head;
    }
    struct ListNode **lists = calloc(k, sizeof(struct ListNode *));
    struct ListNode *p = head;
    struct ListNode *lastTail = NULL;
    struct ListNode *result = NULL;
    int count = 0;
    while (p != NULL) {
        lists[count++] = p;
        p = p->next;
        if (count == k) {
            
            if (lastTail) {
                lastTail->next = lists[k-1];
            }else if (result == NULL){
                result = lists[count - 1];
            }
            for (int i = k - 1; i > 0 ; i--) {
                lists[i]->next = lists[i - 1];
            }
            lastTail = lists[0];
            count = 0;
//            printList(result);
        }
    }
    if (count) {
        if (lastTail) {
            lastTail->next = lists[0];
        }
        if (result == NULL) {
            result = lists[0];
        }
    }else{
        lists[0]->next = NULL;
    }
    return result;
}
int question25(){
    int size = 1;
    int testArray[size];
    for (int i = 0; i < size; i++) {
        testArray[i] = i + 1;
    }
    struct ListNode *result = intArrayToList(testArray, size);
    printList(result);
    result = reverseKGroup(result, 2);
    printList(result);
    return 0;
}


//26. Remove Duplicates from Sorted Array
//Easy
//1213
//2526
//
//
//Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//Example 1:
//
//Given nums = [1,1,2],
//
//Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
//
//It doesn't matter what you leave beyond the returned length.
//Example 2:
//
//Given nums = [0,0,1,1,1,2,2,3,3,4],
//
//Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.
//
//It doesn't matter what values are set beyond the returned length.
//Clarification:
//
//Confused why the returned value is an integer but your answer is an array?
//
//Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.
//
//Internally you can think of this:
//
//// nums is passed in by reference. (i.e., without making a copy)
//int len = removeDuplicates(nums);
//
//// any modification to nums in your function would be known by the caller.
//// using the length returned by your function, it prints the first len elements.
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}
int removeDuplicates(int* nums, int numsSize) {
    if (numsSize <= 1) {
        return numsSize;
    }
    int *p = nums;
    int *pNext = nums+1;
    for (int i = 0; i < numsSize - 1; i++) {
        if (*pNext == *p) {
            pNext++;
        }else{
            p++;
            *p = *pNext;
            pNext++;
        }
    }
    return (int)(p - nums + 1);
}
int question26(){
    int count = 15;
    int array[count];
    for (int i = 0, k = 0; k < count; i++) {
        for (int j = 5 - i; j > 0; j--) {
            array[k++] = i + 1;
//            array[k++] = 0;
        }
    }
    for (int i = 0; i < count; i++) {
        printf(" %d ", array[i]);
    }
//    struct ListNode *nums = intArrayToList(array, count);
//    printList(nums);
    int resultLen = removeDuplicates(array, count);
    printf("\nresult:\n");
    for (int i = 0; i < resultLen; i++) {
        printf(" %d ", array[i]);
    }
    return 0;
}

//27. Remove Element
//Easy
//638
//1377
//
//
//Given an array nums and a value val, remove all instances of that value in-place and return the new length.
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//The order of elements can be changed. It doesn't matter what you leave beyond the new length.
//
//Example 1:
//
//Given nums = [3,2,2,3], val = 3,
//
//Your function should return length = 2, with the first two elements of nums being 2.
//
//It doesn't matter what you leave beyond the returned length.
//Example 2:
//
//Given nums = [0,1,2,2,3,0,4,2], val = 2,
//
//Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.
//
//Note that the order of those five elements can be arbitrary.
//
//It doesn't matter what values are set beyond the returned length.
//Clarification:
//
//Confused why the returned value is an integer but your answer is an array?
//
//Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.
//
//Internally you can think of this:
//
//// nums is passed in by reference. (i.e., without making a copy)
//int len = removeElement(nums, val);
//
//// any modification to nums in your function would be known by the caller.
//// using the length returned by your function, it prints the first len elements.
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}
int removeElement(int* nums, int numsSize, int val) {
    int count = 0;
    for (int *pLeft = nums,*pRight = nums + numsSize - 1; pLeft <= pRight; pLeft++) {
        if (*pLeft != val) {
            count++;
        }else{
            while (*pRight == val && pRight > pLeft) {
                pRight--;
            }
            if (pRight > pLeft) {
                *pLeft = *pRight;
                pRight--;
                count++;
            }
        }
    }
    return count;
}
int question27(){
    int count = 15;
    int array[count];
    for (int i = 0, k = 0; k < count; i++) {
        for (int j = 5 - i; j > 0; j--) {
            array[k++] = i + 1;
            //            array[k++] = 0;
        }
    }
    for (int i = 0; i < count; i++) {
        printf(" %d ", array[i]);
    }
    
    //    struct ListNode *nums = intArrayToList(array, count);
    //    printList(nums);
    int resultLen = removeElement(array, count, 3);
    printf("\nresult:\n");
    for (int i = 0; i < resultLen; i++) {
        printf(" %d ", array[i]);
    }
    return 0;
}

//28. Implement strStr()
//Easy
//680
//1051
//
//
//Implement strStr().
//
//Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//Example 1:
//
//Input: haystack = "hello", needle = "ll"
//Output: 2
//Example 2:
//
//Input: haystack = "aaaaa", needle = "bba"
//Output: -1
//Clarification:
//
//What should we return when needle is an empty string? This is a great question to ask during an interview.
//
//For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
int strStr(char* haystack, char* needle) {
    if (*haystack == '\0' && *needle == *haystack) {
        return 0;
    }
    char *p1Haystack = haystack;
    while (*p1Haystack != '\0') {
        char *p2Haystack = p1Haystack;
        char *pNeedle = needle;
        bool continueFlag = true;
        while (continueFlag && *pNeedle != '\0' && *p2Haystack != '\0') {
            if (*p2Haystack != *pNeedle) {
                continueFlag = false;
            }else{
                p2Haystack++;
                pNeedle++;
            }
        }
        if (*pNeedle == '\0') {
            return (int)(p1Haystack - haystack);
        }
        if (*p2Haystack == '\0') {  //!!! the difference between 0ms and 468ms
            return -1;
        }
        p1Haystack++;
    }
    return -1;
}

int question28(){
    char *str1 = "mississippi";
    char *str2 = "issip";
    printf("result: %d",strStr(str1, str2));
    return 0;
}




//29. Divide Two Integers
//Medium
//493
//2326
//
//
//Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
//
//Return the quotient after dividing dividend by divisor.
//
//The integer division should truncate toward zero.
//
//Example 1:
//
//Input: dividend = 10, divisor = 3
//Output: 3
//Example 2:
//
//Input: dividend = 7, divisor = -3
//Output: -2
//Note:
//
//Both dividend and divisor will be 32-bit signed integers.
//The divisor will never be 0.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.
int divideOnce(uint *dividend, int divisor){
    if (*dividend < divisor) {
        return 0;
    }
    bool continueFlag = true;
    int i = 0;
    for (; continueFlag && i < 32; i++) {
        if (*dividend < (divisor << i)) {
            continueFlag = false;
            i--;
            i--;
        }
    }
    *dividend -= divisor << i;
    return 1 << i;
}
int divide(int dividend, int divisor) {
    if (divisor == 1) {
        return dividend;
    }
    uint result = 0;
    int flagDividend = dividend > 0 ? 1 : 0;
    int flagDivisor  = divisor  > 0 ? 1 : 0;
    uint newDividend = flagDividend ? dividend : -dividend;
    uint newDivisor  = flagDivisor  ? divisor  : -divisor;
    int tempResult = 0;
    do {
        //        printf("\ntempReult(%d) result(%d) newDividend(%d) divisor(%d)",tempResult,result, newDividend, newDivisor);
        tempResult = divideOnce(&newDividend, newDivisor);
        result += tempResult;
    } while (tempResult);
    if (result > INT32_MAX) {
        result = INT32_MAX;
    }
    if (flagDivisor ^ flagDividend) {
        result = -result;
    }
    return (int)result;
}
int question29(){
    printf("result : %d",divide(-2147483648, -1));
    return 0;
}


//31. Next Permutation
//Medium
//1243
//349
//
//
//Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
//
//If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
//
//The replacement must be in-place and use only constant extra memory.
//
//Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
//
//1,2,3 → 1,3,2
//3,2,1 → 1,2,3
//1,1,5 → 1,5,1
//
//Accepted
//193,632
//Submissions
//655,621

void nextPermutation(int* nums, int numsSize) {
    int swapIndex = -1;
    int max = INT32_MIN;
    for (int i = numsSize - 1; i >= 0 && swapIndex < 0; i--) {
        if (max > nums[i]) {
            swapIndex = i;
        }else{
            max = nums[i];
        }
    }
    if (swapIndex >= 0) {
        for (int i = numsSize - 1; i >= 0 ; i--) {
            if (nums[i] > nums[swapIndex]) {
                nums[i] += nums[swapIndex];
                nums[swapIndex] = nums[i] - nums[swapIndex];
                nums[i] -= nums[swapIndex];
                i = 0;
            }
        }
    }
    qsort(nums + swapIndex + 1, numsSize - swapIndex - 1, sizeof(int), compareIntFunction);
}

int question31(){
    int nums[4] = {1,2,3,4};
    nextPermutation(nums, 4);
    for (int i = 0; i < 4; i++) {
        printf(" %d",nums[i]);
    }
    return 0;
}



//70. Climbing Stairs
//You are climbing a stair case. It takes n steps to reach to the top.
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//Note: Given n will be a positive integer.
//Example 1:
//Input: 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//Input: 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step
int question70(){
    int step = 4;
    int climbStairs(int n);
    int result = climbStairs(step);
    printf("climb %d,has %d way",step,result);
    return 0;
}

int climbStairs(int n) {
    int temp = 0;
    int result = 1;
    int lastResult = 0;
    for (int i = 1; i <= n; i++) {
        temp = lastResult;
        lastResult = result;
        result += temp;
    }
    return result;
}

