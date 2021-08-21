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
1.0000 rank_01836_204532002 rank_00584_204507993
1.0000 rank_01741_204531116 rank_00584_204507993
0.9677 rank_01581_204526665 rank_00584_204507993
0.8929 rank_00421_204500291 rank_00410_204500036
0.8889 rank_01177_204522170 rank_00421_204500291
Weekly_253/2096/python
0.9643 rank_00975_204504433 rank_00247_535004293
0.8571 rank_00975_204504433 rank_00962_204511480
Weekly_253/2096/java
1.0000 rank_01541_204508724 rank_00967_204503303
0.9512 rank_02007_204511743 rank_01258_204518679
0.9000 rank_02072_204528105 rank_01478_204513809
0.8947 rank_01672_204529170 rank_01258_204518679
0.8750 rank_02072_204528105 rank_01972_204510711
0.8667 rank_01478_204513809 rank_01136_204516051
0.8667 rank_01384_535015644 rank_01228_535025866
0.8636 rank_01136_204516051 rank_01102_204515129
0.8537 rank_02007_204511743 rank_01261_204520778
0.8529 rank_01999_204510751 rank_01783_535039808
Weekly_253/2096/cpp
1.0000 rank_02086_204531792 rank_02015_535033431
1.0000 rank_01664_535038050 rank_01357_535032296
0.9737 rank_01401_535033428 rank_01357_535032296
0.9706 rank_01021_204513116 rank_00800_204513307
0.9706 rank_00390_535012759 rank_00383_535009404
0.9565 rank_00611_535015574 rank_00578_535014661
0.9429 rank_02120_535044733 rank_02109_535043951
0.9143 rank_01590_535033075 rank_00586_535014900
0.9111 rank_01685_204520172 rank_00752_204509240
0.8947 rank_01860_204522137 rank_01749_204526915
0.8889 rank_01434_535034465 rank_00870_204508889
0.8837 rank_01749_204526915 rank_00752_204509240
0.8750 rank_00732_535018916 rank_00612_535012347
0.8684 rank_01860_204522137 rank_00513_204497048
0.8684 rank_01422_535039603 rank_01174_535030564
0.8605 rank_01749_204526915 rank_01685_204520172
---- reports end: ----

...
```

## How to read Output:
`Weekly_253/2096/python3` means:
For the 253rd weekly contest, the python3 solutions for question_id 2096:

`1.0000 rank_01836_204532002 rank_00584_204507993`
Rank1836's `204532002` submission is 100% similar to rank584's `204507993`


## Similarity calculation：
1. Read the target code and src code into strings target_str and src_str
2. Delete target_str and src_str line breaks and spaces
3. Take every 10 characters of target_str to form target_substr
4. If target_substr is in src_str, similar_count += 1
5. similarity = similar_count / all_count