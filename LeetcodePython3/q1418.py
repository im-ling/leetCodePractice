#!/usr/bin/python3
from typing import List


class Solution:
    def displayTable(self, orders: List[List[str]]) -> List[List[str]]:
        tables = set()
        foods = set()
        map = {}

        for (name, table_str, food) in orders:
            table = int(table_str)
            if table not in tables:
                tables.add(table)
            if food not in foods:
                foods.add(food)
            if table not in map:
                map[table] = {}
            if food not in map[table]:
                map[table][food] = 1
            else:
                map[table][food] += 1

        result = []
        line = ["Table"]
        for food in sorted(foods):
            line.append(food)
        result.append(line)
        for _table in sorted(tables):
            line = [_table]
            for food in sorted(foods):
                if food in map[_table]:
                    line.append(map[_table][food])
                else:
                    line.append(0)
            result.append(line)

        return result

orders = [["David","3","Ceviche"],["Corina","10","Beef Burrito"],["David","3","Fried Chicken"],["Carla","5","Water"],["Carla","5","Ceviche"],["Rous","3","Ceviche"]]
result = Solution().displayTable(orders)
print(result)
