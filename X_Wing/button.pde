class button {

  float tx, ty, ax, ay;
  float T = 0;
  


  button()
  {
    this.tx = width * 0.8;
    this.ty = height * 0.8;
    this.ax = width * 0.15;
    this.ay = height * 0.65;
  }

int counter = 0;
  void drawB()

  { 
    int s = 0;
    //Training Mode Button
    stroke(60, 56, 73);
    fill(255, 0, 0);
    ellipse(tx, ty, 100, 100);

    //ammo bar
    
    for (s = 3; s > 0; s--)
    {
      stroke(60, 56, 73);
      fill(0, 0, 255);
      rect(ax + s * 80, ay, 100, 100);
    }
    for (s = ammo; s > 0; s--)
    {
      stroke(60, 56, 73);
      fill(255, 0, 0);
      rect(ax + s * 80, ay, 100, 100);
    }
    
    if(ammo == 0)
    {
      fill(255,0,0);
      text("OVERHEATING PLEASE WAIT",ax + 200, ay + 200);
    }
    
    counter++;
    
    if(counter > 300)
    {
      counter = 0;
      ammo = 3;
    }
  }
}