//
//  q0101.c
//  LeetCode
//
//  Created by NowOrNever on 30/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0101.h"
#include "../common.h"

//101. Symmetric Tree
//Easy
//
//2785
//
//61
//
//Favorite
//
//Share
//Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
//
//For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
//
//    1
//   / \
//  2   2
// / \ / \
//3  4 4  3
//
//
//But the following [1,2,2,null,3,null,3] is not:
//
//    1
//   / \
//  2   2
//   \   \
//   3    3
//
//
//Note:
//Bonus points if you could solve it both recursively and iteratively.

bool q101compare(struct TreeNode*p, struct TreeNode*q){
    if (p == NULL && q == NULL) {
        return true;
    }else if (p != NULL && q != NULL){
        if (p->val == q->val && q101compare(p->left, q->right) && q101compare(p->right, q->left)) {
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
    return true;
}

bool isSymmetric(struct TreeNode* root){
    if (root) {
        return q101compare(root->left, root->right);
    }
    return true;
}

int question101(){
    return 0;
}
