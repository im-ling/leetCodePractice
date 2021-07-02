class Solution:
    def frequencySort(self, s: str) -> str:
        map = {}
        for char in s:
            if char not in map:
                map[char] = 1
            else:
                map[char] += 1
        array = []
        for key in map.keys():
            array.append([map[key], key])
        array.sort(key=lambda x:x[0])
        result = ""
        for i in reversed(range(len(array))):
            for _ in range(array[i][0]):
                result += array[i][1]
        return result