class ship
{
  float shipx = random(0, width);
  float shipy = 60;
  int bugwidth = 80;
  
  void shipmove()
  {
    shipx += random(-200,200);
    shipy += 30;  
    
     if(shipx < 0)
        {
          shipx = random(0, 200);
        }
        
        if(shipx + bugwidth > width)
        {
          shipx = random(width - 200, width);
        }
  }
   
}