class speed
{
  
  float sx, sy, speedV;  
  speed()
  {
    
    this.sx = width * 0.175;
    this.sy = height * 0.85;
    this.speedV = 0;
  }

  void displays()
  {

    fill(0, 12, 88);
    rect(sx, sy, 200, 80);

    if (move)
    {
      if(speedV > 0)
      {
        fill(255);
        text(int(speedV), sx + 145, sy + 50);
        text("Parsec", sx + 45, sy + 50);
      }
      else
      {
        fill(255);
        text("Sublight", sx + 100, sy + 50);
      }
    }
  }
}