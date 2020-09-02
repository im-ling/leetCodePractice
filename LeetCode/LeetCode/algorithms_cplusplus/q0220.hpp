//
//  q0220.hpp
//  LeetCode
//
//  Created by NowOrNever on 02/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0220_hpp
#define q0220_hpp

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
void question0220(){
    class Solution {
    private:
        void doubleArraySwap(vector<int>& nums, vector<int>& indexs, int i, int j){
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
            temp = indexs[i];
            indexs[i] = indexs[j];
            indexs[j] = temp;
        }
        int doubleArrayQsortPartition(vector<int>& nums, vector<int>& indexs, int low, int high){
            if (high <= low) return low;
            int flag = nums[low];
            int left = low;
            int right = high;
            while (left < right) {
                while (left < right && nums[left] <= flag) left++;
                while (left < right && nums[right] > flag) right--;
                if (left < right) doubleArraySwap(nums, indexs, left++, right--);
            }
            if (nums[left] > flag) left--;
            doubleArraySwap(nums, indexs, left, low);
            return left;
        }
        void doubleArrayQsort(vector<int>& nums, vector<int>& indexs, int low, int high){
            if (high <= low) return;
            int mid = doubleArrayQsortPartition(nums, indexs, low, high);
            doubleArrayQsort(nums, indexs, low, mid - 1);
            doubleArrayQsort(nums, indexs, mid + 1, high);
        }
    public:
        bool containsNearbyAlmostDuplicate(vector<int>& nums, int k, int t) {
            size_t size = nums.size();
            if (size < 2 || k < 1) return false;
            vector<int> indexs(size);
            for (int i = 0; i < size; i++) {
                indexs[i] = i;
            }
            doubleArrayQsort(nums, indexs, 0, int(size - 1));
            for (int i = 0; i < size - 1; i++) {
                for (int j = i + 1; j < size && (long)nums[j] - nums[i] <= t ; j++) {
                    if (abs(indexs[j] - indexs[i]) <= k) {
                        return true;
                    }
                }
            }
            return false;
        }
    };
    
    
    vector<int> nums = {-1, 2147483647};
    int k = 1;
    int t = 2147483647;
    int result = Solution().containsNearbyAlmostDuplicate(nums, k, t);
    cout << result << endl;

}

#endif /* q0220_hpp */
