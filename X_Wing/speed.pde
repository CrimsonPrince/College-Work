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
      fill(255);
      text("4 Parsec", sx, sy + 50);
    }
  }
}