class TimeMap:
    hash_map = {}

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.hash_map = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        if key not in self.hash_map:
            self.hash_map[key] = []
        self.hash_map[key].append([timestamp, value])

    def get(self, key: str, timestamp: int) -> str:
        if key in self.hash_map:
            array = self.hash_map[key]
            if timestamp < array[0][0]:
                return ""
            left = 0
            right = len(array) - 1
            result = 0
            while left <= right:
                mid = (left + right) >> 1
                if array[mid][0] <= timestamp:
                    result = mid
                    left = mid + 1
                else:
                    right = mid - 1
            return array[result][1]
        return ""

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap()
# obj.set(key,value,timestamp)
# param_2 = obj.get(key,timestamp)
