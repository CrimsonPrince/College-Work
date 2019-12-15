var pict_aray = ["Pict_1.png","Pict_2.png","Pict_3.png","Pict_4.png"];
var counter = 0;

function rotatepics() {
	document.getElementById("rotator").src="assets/Images/"+pict_aray[counter];
	counter++;
	setTimeout(rotatepics,5000);
	if(counter == pict_aray.length) { counter = 0;}
}

var quote = [];

quote[0] = 1;
quote[1] = 2;
quote[2] = 3;
quote[3] = 4;

function nextquote() {
	document.getElementById("message").innerHTML = quote[counter];
	counter++;
	
	setTimeout(nextquote, 5000);
	if(counter == quote.length) {counter = 0;}
	
}