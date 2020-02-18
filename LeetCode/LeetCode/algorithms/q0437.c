//
//  q0437.c
//  LeetCode
//
//  Created by NowOrNever on 18/02/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0437.h"
#include "common.h"
//437. Path Sum III
//Easy
//
//2699
//
//198
//
//Add to List
//
//Share
//You are given a binary tree in which each node contains an integer value.
//
//Find the number of paths that sum to a given value.
//
//The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
//
//The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
//
//Example:
//
//root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
//
//      10
//     /  \
//    5   -3
//   / \    \
//  3   2   11
// / \   \
//3  -2   1
//
//Return 3. The paths that sum to 8 are:
//
//1.  5 -> 3
//2.  5 -> 2 -> 1
//3. -3 -> 11
//Accepted
//149,935
//Submissions
//334,812

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */

int pathSum_helper(struct TreeNode* root, int sum){
    if (root) {
        return root->val == sum ? 1 : 0 + pathSum_helper(root->left, sum - root->val) + pathSum_helper(root->right, sum - root->val);
    }
    return 0;
}

int pathSum(struct TreeNode* root, int sum){
    if (root) {
        return pathSum_helper(root, sum) + pathSum(root->left, sum) + pathSum(root->right, sum);
    }
    return 0;
}


int question437(){
    return 0;
}
