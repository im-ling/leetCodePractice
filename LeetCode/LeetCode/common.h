#ifndef common_h
#define common_h

#include <limits.h> //limitation
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>

//custom macro

#define ASCIISIZE 128

#define MIN_AB( a, b) ( (a) < (b) ? (a) : (b) )
//custom macro end


//custom struct
struct ListNode {
    int val;
    struct ListNode *next;
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


#endif
