class star{
  
  float x;
  float y;
  float z;
  float prevz;
  
  star()
  {
     x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    
    prevz = z;
  }
  
  void move()
  {
    z = z - speed;
    
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      prevz = z;
}
    
  }
  
  
  void create()
  {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

   
    float r = map(z, 0, width/2, 4, 0);
    ellipse(sx, sy, r, r);

    float px = map(x / prevz, 0, 1, 0, width/2);
    float py = map(y / prevz, 0, 1, 0, height/2);

    prevz = z;

    stroke(255);
    line(px, py, sx, sy);
    
  }
  
  void staticview()
  {
      fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

   
    float r = map(z, 0, width/2, 4, 0);
    ellipse(sx, sy, r, r);
  }
  
}