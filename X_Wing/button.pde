class button {

  float tx, ty,ax,ay;
  float T = 0;
  
  
  
  button()
  {
    this.tx = width * 0.8;
    this.ty = height * 0.8;
    this.ax = width * 0.4;
    this.ay = height * 0.8;
  }

  void drawB()

  { 
    int s = 0;
    //Training Mode Button
    stroke(60, 56, 73);
    fill(255, 0, 0);
    ellipse(tx,ty,100,100);
    
    //ammo bar
     for(s = ammo;s > 0; s++)
     {
       fill(255);
       rect(ax,ay,30,30);
     }
  }

}