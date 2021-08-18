# contestCheatingCheck

## How to use:
1. 修改check.py 文件中main函数中参数
```
    # contest number
    contest_number = 253
    # 调查多少页的人
    paginations = 35
    # 需要查抄袭的题目 [2095, 2096]
    # question_id 可用 https://leetcode-cn.com/contest/api/ranking/weekly-contest-253/?pagination=0 查询
    question_ids = [2096]
    # 相似度（高于这个阈值会被记录）
    similar_threshold = 0.85
```
2. 运行check.py



## Output Example:

```
...

---- reports: ----
Weekly_253/2096/python3
1.0000 rank_00819_204532002 rank_00271_204507993
1.0000 rank_00777_204531116 rank_00271_204507993
0.9702 rank_00819_204532002 rank_00703_204526665
0.9702 rank_00777_204531116 rank_00703_204526665
0.9671 rank_00703_204526665 rank_00271_204507993
Weekly_253/2096/java
1.0000 rank_00683_204508724 rank_00434_204503303
0.8694 rank_00656_204513809 rank_00515_204516051
0.8690 rank_00742_204529170 rank_00560_204518679
Weekly_253/2096/cpp
0.9735 rank_00460_204513116 rank_00360_204513307
0.9067 rank_00749_204520172 rank_00341_204509240
0.8957 rank_00781_204526915 rank_00341_204509240
0.8768 rank_00781_204526915 rank_00749_204520172
0.8667 rank_00831_204522137 rank_00235_204497048
0.8640 rank_00831_204522137 rank_00781_204526915
0.8605 rank_00614_204503466 rank_00146_204500468
---- reports end: ----

...
```

## 如何阅读 Output:
`Weekly_253/2096/python3`中:
`Weekly_253` 为第253场周赛
`2096` 为检查的题号
`python3` 为解题语言

`1.0000 rank_00819_204532002 rank_00777_204531116`
rank819 的 `204532002` 提交与 rank777 的 `204531116` 相似度为 100%

## 相似度计算：
1.将target代码和src代码读成字符串target_str和src_str
2.删除target_str和src_str换行和空格
3.利用滑动窗口取target_str每10个字符组成target_substr
4.如果target_substr在src_str中， similar_count += 1
5. similar = similar_count / all_count