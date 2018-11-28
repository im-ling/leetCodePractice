//
//  main.m
//  LeetCode
//
//  Created by DoubleL on 2018/11/22.
//  Copyright © 2018 DoubleL. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
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
//        int question10(void);   //todo: dp
//        question10();

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
bool isMatch(char *s, char* p)
{
//    printf("\ns(%s) p(%s)",s,p);
    if(*p == '\0')
        return *s=='\0';
    if(*(p+1) == '*')
        return isMatch(s, p+2) ||  //match zero letter in s;
        (*s!='\0' && (*s==*p || '.'==*p) && isMatch(++s, p)); //match one or more;
    else
        return *s!='\0' && (*s==*p || '.'==*p) && isMatch(++s, ++p);
}

//todo: dp solution
//
//
int question10(){
    char *str = "bbbba";
//    char *pattern = "b.*c";
    char *pattern = ".*a*a";
    //    11、121
    printf("isMatch %d\n",isMatch(str, pattern));
    return 0;
};

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

