//
//  q0104.c
//  LeetCode
//
//  Created by NowOrNever on 30/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0104.h"
#include "../common.h"

//104. Maximum Depth of Binary Tree
//Easy
//
//1652
//
//61
//
//Favorite
//
//Share
//Given a binary tree, find its maximum depth.
//
//The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given binary tree [3,9,20,null,null,15,7],
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its depth = 3.
//
//Accepted
//612,497
//Submissions
//977,844


/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */


int maxDepth(struct TreeNode* root){
    if (root) {
        int left_len = maxDepth(root->left);
        int right_len = maxDepth(root->right);
        return 1 + (left_len > right_len ? left_len : right_len);
    }
    return 0;
}

int question104(){
    return 0;
}
