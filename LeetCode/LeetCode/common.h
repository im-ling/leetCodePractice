#ifndef common_h
#define common_h

#include <limits.h> //limitation
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

//custom macro

#define ASCIISIZE 128

#define MIN_AB( a, b) ( (a) < (b) ? (a) : (b) )
//custom macro end


//custom struct
struct ListNode {
    int val;
    struct ListNode *next;
};

//Definition for a binary tree node.
struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};
//custom struct end


//custom function
int compareIntFunction(const void *a, const void *b);

int printListWithThreshold(struct ListNode* list, int threshold);
int printList(struct ListNode* list);
int printTwoDimensionLists(struct ListNode** lists, int listsSize);
struct ListNode* intArrayToList(int *array, int number);

struct ListNode* initAListNodeWithLength(int listLen);

struct ListNode* initANodeListWithLenAndThreshold(int listLen, int threshold); //init a nodelist with random number under the threshold

int maxValue(int x, int y);
//custom function end


// stdbool.h
#ifndef _STDBOOL_H_
#define    _STDBOOL_H_

#define    __bool_true_false_are_defined    1

#ifndef __cplusplus

#define    false    0
#define    true    1

#define    bool    _Bool
#if __STDC_VERSION__ < 199901L && __GNUC__ < 3
typedef    int    _Bool;
#endif

#endif /* !__cplusplus */
#endif /* !_STDBOOL_H_ */

#endif
