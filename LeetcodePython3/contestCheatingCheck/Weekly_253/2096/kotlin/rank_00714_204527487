import java.lang.Math.abs

class Solution {
    fun longestObstacleCourseAtEachPosition(obstacles: IntArray): IntArray {
        val result = mutableListOf<Int>()
        val maxLongestIncrease =  mutableListOf<Pair<Int, Int>>() //pair(length, index)
        if (obstacles.isEmpty()) {
            return emptyArray<Int>().toIntArray()
        }

        maxLongestIncrease.add(Pair(obstacles[0], 0))
        result.add(1)

        for (i in 1 until obstacles.size) {
            if (obstacles[i] >= maxLongestIncrease.last().first) {
                maxLongestIncrease.add(Pair(obstacles[i], i))
                result.add(maxLongestIncrease.size)
                continue
            }
            val index = findFirst(maxLongestIncrease, obstacles[i])
            result.add(index + 1)
            maxLongestIncrease[index] = Pair(obstacles[i], i)
        }
        return result.toIntArray()
    }
    fun findFirst(obstacles: List<Pair<Int, Int>>, target: Int) : Int {
        var index = obstacles.binarySearch{ it.first.compareTo(target) }
        if (index < 0) {
            index += 1
            index = -index
        } else {
            while(index < obstacles.size && obstacles[index].first == target) {
                index += 1
            }
        }
        return index
    }
}