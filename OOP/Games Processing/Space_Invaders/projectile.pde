class projectile
{
  
  float projy;
  float projx;
  
  projectile(float playerx1)
  {
    
    projy = 50;
    projx = playerx1;
  }
  
  void drawproj()
  {
   
    stroke(4);
    line(projx, projy, projx, projy + 30);
  }
  
  void updateproj()
  {
    float speed = 100;
    projy =+ speed;
  }
}