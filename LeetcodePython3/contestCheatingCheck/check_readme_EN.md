# contestCheatingCheck

## How to use:
1. modify the parameters of main function in file [check.py](https://github.com/im-ling/leetCodePractice/blob/cheating_check/LeetcodePython3/contestCheatingCheck/check.py) 
```
    # contest number
    contest_number = 253
    # how many pages you wanna investigate
    paginations = 35
    # the question_id you wanna investigate [2095, 2096]
    # you can use url "https://leetcode.com/contest/api/ranking/weekly-contest-253/?pagination=1&region=global" to search the question_id of the question of the contest
    question_ids = [2096]
    # similarity threshold, only the similarity over the setting will be record
    similar_threshold = 0.85
```
2. run check.py (Due to occasional requests being abandoned, you may need to run twice)



## Output Example:

```
...

---- reports: ----
Weekly_253/2096/python3
1.0000 rank_00819_204532002 rank_00271_204507993
1.0000 rank_00777_204531116 rank_00271_204507993
0.9677 rank_00703_204526665 rank_00271_204507993
0.8929 rank_00195_204500291 rank_00188_204500036
0.8889 rank_00530_204522170 rank_00195_204500291
Weekly_253/2096/python
0.8571 rank_00436_204504433 rank_00431_204511480
Weekly_253/2096/java
1.0000 rank_00683_204508724 rank_00434_204503303
0.8947 rank_00742_204529170 rank_00560_204518679
0.8667 rank_00656_204513809 rank_00515_204516051
0.8636 rank_00515_204516051 rank_00498_204515129
Weekly_253/2096/cpp
0.9706 rank_00460_204513116 rank_00360_204513307
0.9111 rank_00749_204520172 rank_00341_204509240
0.8947 rank_00831_204522137 rank_00781_204526915
0.8837 rank_00781_204526915 rank_00341_204509240
0.8684 rank_00831_204522137 rank_00235_204497048
0.8605 rank_00781_204526915 rank_00749_204520172
---- reports end: ----

...
```

## How to read Output:
`Weekly_253/2096/python3` means:
For the 253rd weekly contest, the python3 solutions for question_id 2096:

`1.0000 rank_00819_204532002 rank_00271_204507993`
Rank819's `204532002` submission is 100% similar to rank271's `204531116`


## Similarity calculation：
1. Read the target code and src code into strings target_str and src_str
2. Delete target_str and src_str line breaks and spaces
3. Take every 10 characters of target_str to form target_substr
4. If target_substr is in src_str, similar_count += 1
5. similarity = similar_count / all_count