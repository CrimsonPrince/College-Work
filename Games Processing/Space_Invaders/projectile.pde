class projectile
{
  
  
  projectile(float playerx1)
  {
    float projy = 50;
    float playerx = playerx1;
  }
  
  void projectile()
  {
   
    stroke(4);
    line(playerx, projy, playerx, projy + 30);
  }
}