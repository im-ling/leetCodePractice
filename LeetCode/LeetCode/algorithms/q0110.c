//
//  q0110.c
//  LeetCode
//
//  Created by NowOrNever on 30/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0110.h"
#include "../common.h"
#include "q0104.h"

//110. Balanced Binary Tree
//Easy
//
//1520
//
//139
//
//Favorite
//
//Share
//Given a binary tree, determine if it is height-balanced.
//
//For this problem, a height-balanced binary tree is defined as:
//
//a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
//
//
//
//Example 1:
//
//Given the following tree [3,9,20,null,null,15,7]:
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//Return true.
//
//Example 2:
//
//Given the following tree [1,2,2,3,3,null,null,4,4]:
//
//       1
//      / \
//     2   2
//    / \
//   3   3
//  / \
// 4   4
//Return false.
//
//Accepted
//367,579
//Submissions
//875,998

//int maxDepth(struct TreeNode* root){
//    if (root) {
//        int left_len = maxDepth(root->left);
//        int right_len = maxDepth(root->right);
//        return 1 + (left_len > right_len ? left_len : right_len);
//    }
//    return 0;
//}
//
//bool isBalanced(struct TreeNode* root){
//    if (root) {
//        int diff = maxDepth(root->left) - maxDepth(root->right);
//        if (diff > -2 && diff < 2) {
//            return isBalanced(root->left) + isBalanced(root->right) == 2;
//        }else{
//            return 0;
//        }
//    }
//    return 1;
//}


//bottom to up solution:
int q110depth(struct TreeNode* node){
    if (!node) {
        return 0;
    }
    int left_len = q110depth(node->left);
    if (left_len == -1) {
        return -1;
    }

    int right_len = q110depth(node->right);
    if (right_len == -1) {
        return -1;
    }

    if (abs(left_len - right_len) > 1) {
        return -1;
    }

    return (left_len > right_len ? left_len : right_len) + 1;
}
bool isBalanced(struct TreeNode* root){
    return (q110depth(root) != -1);
}



//int q110depth(struct TreeNode* root, bool *result){
//    if (root) {
//        int left = q110depth(root->left, result);
//        int right = q110depth(root->right, result);
//        *result = *result && abs(left - right) < 2;
//        return (left > right ? left : right) + 1;
////        cost more time !??? why?
////        if (*result) {
////            return (left > right ? left : right) + 1;
////        }
////        return 0;
//    }
//    return 0;
//}
//
//bool isBalanced(struct TreeNode* root){
//    bool result = true;
//
//    q110depth(root, &result);
//
//    return result;
//}

int question110(){
    return 0;
}

