void setup()
{
  size(500,500);
}

void draw()
{
  //background(0);
 // noStroke();
  //fill(255);
  //ellipse(mouseX, mouseY, 100, 100);
 // println(mouseX + " " + mouseY); //Uses the coordinates for the location of crusor
  
  if(frameCount % 60 == 0)
  
  {
    background(random(0, 255), random(0, 255), random(0,255));
  }
}