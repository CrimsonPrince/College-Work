class shipstatus
{
  float x, y;
  shipstatus()
  {
    x = width * 0.65;
    y = height * 0.85;
  }

  void displaystatus()
  {
    stroke(60, 56, 73);
    fill(0);
    ellipse(x, y, 250, 250);
    image(xwing, x -75, y - 75);
    noStroke();
    fill(255,0,0);
    if(dist(mouseX, mouseY,x,y) <= 125)
    {
      
    }
  }
}