// Take in string as argument
// For each letter in the string:
// Starting at the last letter, add to new string
// End loop

var word = "hello";
var newWord = "";

for(i = word.length - 1; i >= 0; i--){
  newWord = newWord + word[i];
}

console.log(newWord);

function reverse(string){
  
  var newWord = "";

  for(i = string.length - 1; i >= 0; i--){
  newWord = newWord + string[i];
  }

  return newWord
}

newWord = reverse("probably");

if (1 != 5){
  console.log(newWord);
}

