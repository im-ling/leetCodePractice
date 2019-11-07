//
//  q0112.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0112.h"
#include "../common.h"
//112. Path Sum
//Easy
//
//1198
//
//380
//
//Favorite
//
//Share
//Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given the below binary tree and sum = 22,
//
//      5
//     / \
//    4   8
//   /   / \
//  11  13  4
// /  \      \
//7    2      1
//return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
//
//Accepted
//366,858
//Submissions
//940,089

//bool hasPathSum(struct TreeNode* root, int sum){
//    if (root) {
//        sum -= root->val;
//        if ((sum == 0 && !root->left && !root->right) || hasPathSum(root->left, sum) || hasPathSum(root->right, sum)) {
//            return 1;
//        }
//    }
//    return 0;
//}

bool hasPathSum(struct TreeNode* root, int sum){
    if (root) {
        sum -= root->val;
        if (!root->left && !root->right) {
            return !sum;
        }
        if (hasPathSum(root->left, sum) || hasPathSum(root->right, sum)) {
            return 1;
        }
    }
    return 0;
}

//        if ((sum == 0 && !root->left && !root->right) || hasPathSum(root->left, sum) || hasPathSum(root->right, sum)) 多了访问次数


int question112(){
    return 0;
}
