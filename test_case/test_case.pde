// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/17WoOqgXsRM

// I create an array named "stars",
// it will be filled with 800 elements made with the Star() class.
Star[] stars = new Star[2000];

// I create a variable "speed", it'll be useful to control the speed of stars.
float speed;

void setup() {
  fullScreen(P3D);
  // I fill the array with a for loop;
  // running 800 times, it creates a new star using the Star() class.
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}
float shift = width/2;
void draw() {
  // i link the value of the speed variable to the mouse position.
  speed = map(mouseX, 0, width, 0, 70);

  background(0);
  // I shift the entire composition,
  // moving its center from the top left corner to the center of the canvas.
  translate(width/2, height/2);
  // I draw each star, running the "update" method to update its position and
  // the "show" method to show it on the canvas.
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  
  
  
  if(keyPressed)
  {
    if(keyCode == LEFT)
    {
      camera(shift, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), shift, height/2.0, 0, 0, 1, 0);
      shift -= 10;
       for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
    }
    if(keyCode == RIGHT)
    {
      translate(shift, height/2);
      shift += 10;
    }
  }
}