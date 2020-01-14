void setup(){
  size(500, 500);
}

void draw(){
  background(0);
//stroke(255);
 //ellipse(mouseX, mouseY, 100, 100);
 fill(255,0,0);
 stroke(0);
arc(mouseX, mouseY, 150, 150, PI - 0.2f, TWO_PI +0.2f, PIE);
fill(255);
stroke(255);
rect(mouseX - 7, mouseY - 0.1 , 20, 40);
ellipse(mouseX-30, mouseY -50, 20, 20);

}