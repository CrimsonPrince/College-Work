class crosshair {

  int t, f,i;
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
    }ship ship1;
    ship1 = new ship();
    if(ships.size() > 0)
    {
      for (i=0; i < 3; i++)
      {
        ship1=ships.get(i);
        
        if(dist(mouseX, mouseY, ship1.x,ship1.y) <= 30)
        {
          seek = true;
        }
      }
    }
  }

  void fire()
  {
    if (t == 1)
    {
      stroke(0, 255, 0);
      line(lx, ly, mouseX, mouseY);

      f = f + 1;

      if (f == 10)
      {
        f=0;
        t = 0;
      }
      soundplayer(laser);

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