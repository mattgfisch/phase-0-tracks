// ---------- LONGEST PHRASE

// Accept array of strings as an argument
// Create 'longest string' variable
// Loop through array, measuring length of each element
// If element is longer than the element before it, it gets stored as 'longest string'
// Return 'longest string'

function longestString(strings){
  longest = "";
  for(i = 0; i < strings.length; i++){
    if (strings[i].length > longest.length){
      longest = strings[i];
    }
  }
  return longest;
}



// ---------- KEY-VALUE MATCH

// Accept two objects as arguments
// Initialize sharePair = false
// Outside Loop through object 1
// Inside Loop through object 2
// If property of object 2 is equal to property of object 1, compare values
// If values are the same, set sharePair to true
// Return sharePair

function findMatch(object1, object2){
  sharePair = false;
  for (var prop1 in object1){
    for (var prop2 in object2){
      if (prop1 == prop2 && object1[prop1] == object2[prop2]){
        sharePair = true;
      }
    }
  }

  return sharePair;
}


// ---------- TEST CODE

// LONGEST PHRASE
testArray = ["long phrase","longest phrase","something something something else","longer phrase", "short", "something something something els", "happy"];

console.log(longestString(testArray));


// KEY-VALUE MATCH

// Match
obj1 = {name: "Steven", age: 53, birthday: "1995"};
obj2 = {name: "Steve", age: 53, isNormal: false};

// No Match
obj3 = {name: "Steven", age: 58, birthday: "1995"};
obj4 = {name: "Steve", age: 53, isNormal: false};

// Should return true
console.log(findMatch(obj1, obj2));
// Should return false
console.log(findMatch(obj3, obj4));












