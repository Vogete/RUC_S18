/* jshint esversion: 6 */

var arrayOfWords = ["potato", "tomato", "strawberry", "avocado", "mango", "banana"];

// Part A
function sizeOfLongest(words) {
    var longest = 0;
    for (let i = 0; i < words.length; i++) {
        if (words[i].length > longest) {
            longest = words[i].length;
        }
    }
    return longest;
}
console.log("Part A: " + sizeOfLongest(arrayOfWords));


//Part B
function getLongestWord(words) {
    var word = "";
    for (let i = 0; i < words.length; i++) {
        if (words[i].length > word.length) {
            word = words[i];
        }
    }
    return word;
}
console.log("Part B: " + getLongestWord(arrayOfWords));


// Part C
function max(num1, num2) {
    if (num1 > 1) {
        return num1;
    } else {
        return num2;
    }
}
console.log("Part C: " + max(15, 2));

// Part D

function max2() {
    var largest = arguments[0];
    for (let i = 0; i < arguments.length; i++) {
        if (arguments[i] > largest) {
            largest = arguments[i];
        }
    }
    return largest;
}
console.log("Part D: " + max2(15, 2, 25, -2, 43));


// Part E
function currentDay() {
    return new Date().toLocaleString('en-us', {  weekday: 'long' });
}
console.log("Part E: " + currentDay());
