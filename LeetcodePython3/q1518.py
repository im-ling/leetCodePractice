class Solution:
    def numWaterBottles(self, numBottles: int, numExchange: int) -> int:
        result = numBottles
        empty = numBottles
        while empty >= numExchange:
            result += empty // numExchange
            empty = empty // numExchange + empty % numExchange
        return result