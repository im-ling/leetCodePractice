/**
 * @param {number[]} obstacles
 * @return {number[]}
 */
var longestObstacleCourseAtEachPosition = function(obstacles) {
    let res = new Array(obstacles.length);
    let sorted = new Array(obstacles.length + 1).fill(0);
    let length = 1;

    res[0] = length;
    sorted[length] = obstacles[0];
    for (let i = 1, len = obstacles.length; i < len; i++) {
        if (obstacles[i] >= sorted[length]) {
            length++;
            res[i] = length;
            sorted[length] = obstacles[i];
        } else {
            let left = 1;
            let right = length;
            let index = 0;

            while (left <= right) {
                const mid = (left + right) >>> 1;

                if (sorted[mid] <= obstacles[i]) {
                    left = mid + 1;
                } else {
                    index = mid;
                    right = mid - 1;
                }
            }
            res[i] = index;
            sorted[index] = obstacles[i];
        }
    }

    return res;
};
