//
//  q0108.c
//  LeetCode
//
//  Created by NowOrNever on 30/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0108.h"
#include "../common.h"

//108. Convert Sorted Array to Binary Search Tree
//Easy
//
//1500
//
//153
//
//Favorite
//
//Share
//Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
//
//For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
//
//Example:
//
//Given the sorted array: [-10,-3,0,5,9],
//
//One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
//
//      0
//     / \
//   -3   9
//   /   /
// -10  5
//Accepted
//310,471
//Submissions
//582,351


/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */


struct TreeNode* sortedArrayToBST(int* nums, int numsSize){
    if (numsSize <= 0) {
        return NULL;
    }else if (numsSize == 1){
        struct TreeNode* newNode = calloc(1, sizeof(struct TreeNode));
        newNode->val = nums[0];
        return newNode;
    }else{
        int middle = numsSize / 2;
        struct TreeNode* newNode = calloc(1, sizeof(struct TreeNode));
        newNode->val = nums[middle];
        newNode->left = sortedArrayToBST(nums, middle);
        newNode->right = sortedArrayToBST(nums + middle + 1, numsSize - middle - 1);
        return newNode;
    }
}

int question108(){
    return 0;
}
