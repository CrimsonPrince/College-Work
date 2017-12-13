class Radar
{
  float cx, cy;
  float radius;
  float theta;
  float speed;
  float frequency;
  color c;
  ship ship1;
  
  Radar(float cx, float cy, float radius, float frequency, color c)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
    this.speed = (TWO_PI / 60.0) * frequency;
    this.theta = 0;
    this.c = c;
    ship1  = new ship();
  }
  
  void update()
  {
    theta += speed;
  }
  
 
  
  
  void render()
  {
    stroke(0, 255, 0);
    fill(0);
    ellipse(cx, cy, radius * 2, radius * 2);
    int trailLength = 10;
    float greenIntensity = 255 / (float)trailLength;
    for(int i = 0 ; i < trailLength ; i ++)
    {
      stroke(0, i * greenIntensity, 0);
      float x = cx + sin(theta + i * speed) * radius;
      float y = cy -cos(theta + i * speed) * radius;
      line(cx, cy, x, y);
    }
    
    float sx = 0;
    float sy = 0;
    if (ships.size() > 0)
      {
        fill(255,255,0);
        ship1 = ships.get(0);
        sx = map(ship1.x,0, width,cx -50, cx + 50);
        sy = map(ship1.y,0,600,cy -50, cy + 50);
        ellipse(sx,sy,2,2);
      }
  }
}