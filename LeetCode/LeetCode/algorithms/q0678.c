//
//  q0678.c
//  LeetCode
//
//  Created by NowOrNever on 13/02/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0678.h"
#include "common.h"

// greedy
//Approach #3: Greedy [Accepted]
//Intuition
//
//When checking whether the string is valid, we only cared about the "balance": the number of extra, open left brackets as we parsed through the string. For example, when checking whether '(()())' is valid, we had a balance of 1, 2, 1, 2, 1, 0 as we parse through the string: '(' has 1 left bracket, '((' has 2, '(()' has 1, and so on. This means that after parsing the first i symbols, (which may include asterisks,) we only need to keep track of what the balance could be.
//
//For example, if we have string '(***)', then as we parse each symbol, the set of possible values for the balance is [1] for '('; [0, 1, 2] for '(*'; [0, 1, 2, 3] for '(**'; [0, 1, 2, 3, 4] for '(***', and [0, 1, 2, 3] for '(***)'.
//
//Furthermore, we can prove these states always form a contiguous interval. Thus, we only need to know the left and right bounds of this interval. That is, we would keep those intermediate states described above as [lo, hi] = [1, 1], [0, 2], [0, 3], [0, 4], [0, 3].
//
//Algorithm
//
//Let lo, hi respectively be the smallest and largest possible number of open left brackets after processing the current character in the string.
//
//If we encounter a left bracket (c == '('), then lo++, otherwise we could write a right bracket, so lo--. If we encounter what can be a left bracket (c != ')'), then hi++, otherwise we must write a right bracket, so hi--. If hi < 0, then the current prefix can't be made valid no matter what our choices are. Also, we can never have less than 0 open left brackets. At the end, we should check that we can have exactly 0 open left brackets.
bool checkValidStringGreedy(char * s){
    if (s == NULL) {
        return true;
    }
    int low = 0;
    int high = 0;
    while (*s) {
        if (*s == '('){
            low++;
        }else{
            low--;
        }

        if (*s != ')') {
            high++;
        }else{
            high--;
        }
        
        if (high < 0) {
            break;
        }
        
        low = low > 0 ? low : 0;
        s++;
    }
    return low == 0;
}
// backtracking
bool checkOnce(char *s, int countLeft){
    while (*s) {
        if (*s == '(') {
            countLeft++;
        }else if (*s == ')'){
            if (countLeft < 1) {
                return false;
            }
            countLeft--;
        }else{
            //分别尝试*为'(' ,'' ,')', 其中有一个匹配则该string是valid的
            return checkOnce(++s, countLeft - 1) || checkOnce(s, countLeft) || checkOnce(s, countLeft + 1);
        }
        s++;
    }
    if (countLeft) {
        return false;
    }else{
        return true;
    }
}
bool checkValidString(char * s){
    return checkOnce(s, 0);
}

int question678(){
    char *s = "(())(())(((()*()()()))()((()()(*()())))(((*)()";
    printf("result %d\n", checkValidString(s));
    return 0;
}
