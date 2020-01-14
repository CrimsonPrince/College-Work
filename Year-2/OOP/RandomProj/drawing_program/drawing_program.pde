void setup()
{
  size(500,500);
}

void draw()
{
 // background(0);
  stroke(255);
  fill(255);
//  ellipse(mouseX, mouseY, 100, 100);
  line(pmouseX, pmouseY, mouseX, mouseY);
  println(mouseX + " " + mouseY); //Uses the coordinates for the location of crusor
}