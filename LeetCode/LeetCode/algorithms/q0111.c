//
//  q0111.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0111.h"
#include "../common.h"

//111. Minimum Depth of Binary Tree
//Easy
//
//883
//
//501
//
//Favorite
//
//Share
//Given a binary tree, find its minimum depth.
//
//The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
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
//return its minimum depth = 2.
//
//Accepted
//336,593
//Submissions
//932,645

int minDepth(struct TreeNode* root){
    if (root) {
        if (!root->left) {
            return minDepth(root->right) + 1;
        }
        if (!root->right) {
            return minDepth(root->left) + 1;
        }
        int left = minDepth(root->left);
        int right = minDepth(root->right);
        return (left < right ? left : right) + 1;
    }
    return 0;
}

int question111(){
    return 0;
}
