console.log("The script loaded!");



function changeColor(event){
  event.target.style.color = "#FF0000";
}

var el = document.getElementById("test");
el.addEventListener("click", changeColor);

var containers = document.getElementsByClassName("container");

var image = document.createElement("IMG");

image.setAttribute("src", "water-17.jpg");
image.setAttribute("alt", "Oh no");

containers[0].appendChild(image);



