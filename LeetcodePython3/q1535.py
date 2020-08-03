from typing import List

class Solution:
    def getWinner(self, arr: List[int], k: int) -> int:
        length = len(arr)
        max = arr[0]
        if k >= length - 1:
            for number in arr:
                if max < number:
                    max = number
            return max

        number = 0
        count = 0
        while count < k:
            if arr[0] > arr[1]:
                count += 1
                number = arr.pop(1)
            else:
                count = 1
                number = arr.pop(0)
            arr.append(number)
        return arr[0]

