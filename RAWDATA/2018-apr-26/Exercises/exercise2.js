/* jshint esversion: 6 */

var boys = ["Peter", "lars", "Ole"];
var girls = ["Janne", "hanne", "Sanne"];

// Part A
var all = boys.concat(girls);
console.log("Part A: " + all);

// Part B
var allString = all.join(",");
console.log("Part B: " + allString);

// Part C
var allString2 = all.join("-");
console.log("Part C: " + allString2);

// Part D
all.push("Lone", "Gitte");
console.log("Part D: " + all);

// Part E
all.unshift("Hans", "Kurt");
console.log("Part E: " + all);

// Part F
all.shift();
console.log("Part F: " + all);

// Part G
all.pop();
console.log("Part G: " + all);

// Part H
all.splice(all.findIndex(x => x === "Ole"), 1); all.splice(all.findIndex(x => x === "Janne"), 1);
console.log("Part H: " + all);

// Part I
all.reverse();
console.log("Part I: " + all);

// Part J
all.sort();
console.log("Part J: " + all);

// Part K
all.sort((a, b) => a.toLowerCase().localeCompare(b.toLowerCase()));
console.log("Part K: " + all);

// Part L
all = all.map(x => x = x.toUpperCase());
console.log("Part L: " + all);

// Part M
almostAll = all.filter( x => x == x.startsWith("I") || x.startsWith("L"));
console.log("Part M: " + almostAll);
