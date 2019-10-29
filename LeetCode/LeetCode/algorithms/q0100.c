//
//  q0100.c
//  LeetCode
//
//  Created by NowOrNever on 30/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0100.h"
#include "../common.h"

//100. Same Tree
//Easy
//
//1374
//
//45
//
//Favorite
//
//Share
//Given two binary trees, write a function to check if they are the same or not.
//
//Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
//
//Example 1:
//
//Input:     1         1
//          / \       / \
//         2   3     2   3
//
//        [1,2,3],   [1,2,3]
//
//Output: true
//Example 2:
//
//Input:     1         1
//          /           \
//         2             2
//
//        [1,2],     [1,null,2]
//
//Output: false
//Example 3:
//
//Input:     1         1
//          / \       / \
//         2   1     1   2
//
//        [1,2,1],   [1,1,2]
//
//Output: false
//Accepted
//434,073
//Submissions
//850,579

/**
* Definition for a binary tree node.
* struct TreeNode {
*     int val;
*     struct TreeNode *left;
*     struct TreeNode *right;
* };
*/

//bool isSameTree(struct TreeNode* p, struct TreeNode* q){
//    if (p == NULL && q == NULL) {
//        return true;
//    }
//    if (p != NULL && q != NULL) {
//        if (p->val == q->val) {
//            if (!isSameTree(p->left, q->left)) {
//                return false;
//            }
//            if (!isSameTree(p->right, q->right)) {
//                return false;
//            }
//        }else{
//            return false;
//        }
//    }else{
//        return false;
//    }
//    return true;
//}

bool isSameTree(struct TreeNode* p, struct TreeNode* q){
    if (p == NULL && q == NULL) {
        return true;
    }
    if (p != NULL && q != NULL) {
        if (p->val == q->val && isSameTree(p->left, q->left) && isSameTree(p->right, q->right)) {
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
    return true;
}

int question100(void){
    return 0;
}
