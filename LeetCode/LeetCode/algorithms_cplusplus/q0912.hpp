//
//  q0912.hpp
//  LeetCode
//
//  Created by NowOrNever on 29/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0912_hpp
#define q0912_hpp

#include <iostream>
#include <queue>
#include <algorithm>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <numeric>
#include <stack>
#include <string>

using namespace std;

void question0912(){
    class Solution {
    private:
        void swap(vector<int> &nums, int i, int j){
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        int partition(vector<int> &nums, int low, int high){
            int flag = nums[low];
            int left = low + 1;
            int right = high;
            while (left < right) {
                while (left < right && nums[left] <= flag) left++;
                while (left < right && nums[right] > flag) right--;
                if (left < right) swap(nums, left++, right--);
            }
            if (nums[left] > flag) left--;
            swap(nums, low, left);
            return left;
        }
        void selfSort(vector<int> &nums, int low, int high){
            if (high <= low) return;
            int mid = partition(nums, low, high);
            selfSort(nums, low, mid - 1);
            selfSort(nums, mid + 1, high);
        }
    public:
        vector<int> sortArray(vector<int>& nums) {
            selfSort(nums, 0, (int)nums.size() - 1);
            return nums;
        }
    };
}

#endif /* q0912_hpp */
