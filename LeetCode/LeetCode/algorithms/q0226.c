//
//  q0226.c
//  LeetCode
//
//  Created by NowOrNever on 08/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0226.h"
#include "../common.h"

//226. Invert Binary Tree
//Easy
//
//2170
//
//36
//
//Favorite
//
//Share
//Invert a binary tree.
//
//Example:
//
//Input:
//
//     4
//   /   \
//  2     7
// / \   / \
//1   3 6   9
//Output:
//
//     4
//   /   \
//  7     2
// / \   / \
//9   6 3   1
//Trivia:
//This problem was inspired by this original tweet by Max Howell:
//
//Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
//Accepted
//379,554
//Submissions
//629,454

void reverse_exange(struct TreeNode* node1, struct TreeNode* node2){
    struct TreeNode* temp = NULL;
    temp = node1->left;
    node1->left = node2->right;
    node2->right = temp;
    if (node1->left && node2->right) {
        reverse_exange(node1->left, node2->right);
    }else if (node1->left){
        reverse_exange(node1->left, node1->left);
    }else if (node2->right){
        reverse_exange(node2->right, node1->right);
    }
    
    if (node1 == node2) {
        return;
    }
    
    temp = node1->right;
    node1->right = node2->left;
    node2->left = temp;
    if (node1->right && node2->left) {
        reverse_exange(node1->right, node2->left);
    }else if (node1->right){
        reverse_exange(node1->right, node1->right);
    }else if (node2->left){
        reverse_exange(node2->left, node2->left);
    }
}

struct TreeNode* invertTree(struct TreeNode* root){
    if (root) {
        struct TreeNode* temp = root;
        temp = root->right;
        root->right = root->left;
        root->left = temp;
        invertTree(root->left);
        invertTree(root->right);
    }
    return root;
}
int question226(){
    return 0;
}
