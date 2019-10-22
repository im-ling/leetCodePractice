//
//  q1081.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q1081.h"
#include "../common.h"

//1081. Smallest Subsequence of Distinct Characters
//Medium
//165
//30
//Favorite
//Share
//Return the lexicographically smallest subsequence of text that contains all the distinct characters of text exactly once.
//
//Example 1:
//
//Input: "cdadabcc"
//Output: "adbc"
//Example 2:
//
//Input: "abcd"
//Output: "abcd"
//Example 3:
//
//Input: "ecbacba"
//Output: "eacb"
//Example 4:
//
//Input: "leetcode"
//Output: "letcod"
//
//
//Note:
//
//1 <= text.length <= 1000
//text consists of lowercase English letters.
//
//
//Accepted
//4,707
//Submissions
//10,762

//char * smallestSubsequence(char * text){
//    int len = (int) strlen(text);
//    char *result = calloc(27, sizeof(char));
//    int result_len = 0;
//    int ascii_size = 128;
//    int record[ascii_size];
//    char z_plus_one = 'z' + 1;
//    for (int i = 'a'; i < ascii_size; i++) {
//        record[i] = -1;
//    }
//
//    for (int i = len - 1; i >= 0; i--) {
//        if (text[i] >= 'a' && record[text[i]] == -1) {
//            record[text[i]] = i;
//        }
//    }
//
//    int leftIndex = 0;
//    while (1) {
//        int rightIndex = len;
//        for (char i = 'a'; i < z_plus_one; i++) {
//            if (record[i] != -1 && record[i] < rightIndex) {
//                rightIndex = record[i];
//            }
//        }
//        if (rightIndex == len || leftIndex > rightIndex) {
//            break;
//        }
//        char minChar = z_plus_one;
//        for (int i = leftIndex; i <= rightIndex; i++) {
//            if (record[text[i]] >= 0 && text[i] < minChar) {
//                minChar = text[i];
//                leftIndex = i;
//            }
//        }
//        if (minChar == z_plus_one) {
//            break;
//        }
////        printf("\n left%d(%c) right%d(%c) minChar(%d)",leftIndex,minChar,rightIndex,text[rightIndex],minChar);
//        result[result_len++] = minChar;
//        record[minChar] = -1;
//        leftIndex++;
//    }
////    printf("  %d  ", result_len);
//    return result;
//}

char * smallestSubsequence(char * text){
    int len = (int) strlen(text);
    char *result_stack = calloc(27, sizeof(char));
    int ascii_size = 128;
    int last_appearance_array[ascii_size];
    memset(last_appearance_array, 0, sizeof(int) * ascii_size);
    for (int i = 0; i < len; i++) {
        last_appearance_array[text[i]] = i;
    }
    
    bool seen[ascii_size];
    for (int i = 0; i < ascii_size; i++) {
        seen[i] = false;
    }
    memset(seen, 0, sizeof(bool) * ascii_size);
    int stack_index = -1;
    for (int i = 0; i < len; i++) {
        bool flag = seen[text[i]];
        if (flag) {
            continue;
        }
//        printf("\n stack_index(%d) text[i](%c) result_stack[stack_index](%c) i(%d) result_stack[stack_index](%c) last_appearance_array[result_stack[stack_index]](%d)",stack_index,text[i], result_stack[stack_index], i,result_stack[stack_index],last_appearance_array[result_stack[stack_index]]);
        while (stack_index >= 0 && text[i] < result_stack[stack_index] && i < last_appearance_array[result_stack[stack_index]]) {
            seen[result_stack[stack_index--]] = false;
        }
        seen[text[i]] = true;
        result_stack[++stack_index] = text[i];
//        printf("\n i(%d) stack(%d) %s",i,stack_index,result_stack);
    }
    memset(result_stack + stack_index + 1, 0, sizeof(char) * (26 - stack_index));
    return result_stack;
}


int question1081(){
    char *str =
    "aaeeeceabbfdaefdeefbabaabbdbaadbebfaabfadcaacddebfdbeaceffaaadcaeddbadebdebccbcbccefeaffbfdcdaefeefeffefcfbbbdabdbddcaaeaacecefbbbeaacdafdfbcdfcbedaff";
//    "cdadabcc";
//    "nfrgpdkaawogejjtsiilzbwduusydlijrbyfvacgeguvccpdvhfdxzygndxzpzwaffxgvijhyblrrjtlinysreitegavkrtbzeyzrokwhtwzegxsjbbwqczlfxndsnfxjnxhsezsmxtvkcxevrboxjqrthujosysfwpgrbpozbvugdjvgpeutulqusssruktnghecvwq";
    char *result = smallestSubsequence(str);
    printf("\n q1081 %s \n",result);
    return 0;
}
