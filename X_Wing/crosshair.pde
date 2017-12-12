class crosshair {

  int t,i;
  float lx = width;
  float ly = height;
  void drawaim()
  {
    if (mouseY < height * 0.6)
    {
      cursor(cross);
    } else
    {
      cursor(ARROW);
    }
  }

  void fire()
  {
    if(t == 1)
    {
      stroke(0,255,0);
      line(lx,ly,mouseX,mouseY);
      
      i = i + 1;
      
      if(i == 10)
      {
        i=0;
        t = 0;
      }
      
      /* stroke(0,0,255);
      line(lx,ly,lx,ly+50);
      lx = lx + 0.05;
      ly = ly + 0.05;
      
      i = i + 1;
      
      if(i == 300)
      {
        lx = width;
        ly = height * 0.6;
        t = 0;
      }
      */
      
    }
  }
}