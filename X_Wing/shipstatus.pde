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
     fill(255);
     textFont(f2, 20);
     text("Shield Status 100%",width * 0.5 ,height * 0.72);
     text("Heat Level",width * 0.5 ,height * 0.75);
     text(ammo,width * 0.53    ,height * 0.75);
     text("Ships Destroyed",width * 0.5 ,height * 0.78); 
     text(kill/3 , width * 0.55 ,height * 0.78);
    }
  }
}