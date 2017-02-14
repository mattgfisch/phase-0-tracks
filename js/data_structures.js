var colors = ["blue", "red", "white", "brown"];
var names = ["Ed", "Billy", "Edd", "Eddy"];

colors.push("black");
names.push("Fred");

var horses = {}

for(i = 0; i < colors.length; i++){
  horses[names[i]] = colors[i];
}

console.log(horses);

function Car(type, year, goodMileage) {
  console.log("Making a new car...")
  this.type = type;
  this.year = year;
  this.goodMileage = goodMileage;

  this.radio = function() { console.log ("Turning on the radio..."); };

  this.getsOld = function() { this.goodMileage = false; };
}

var redCar = new Car("Honda", 2008, true);

var blueCar = new Car("Chevrolet", 2006, false);

redCar.radio();

console.log(blueCar);

redCar.getsOld();

console.log(redCar);