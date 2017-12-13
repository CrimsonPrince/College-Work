class star {

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

  void hyper()
  {
    speed = 30;
    z = z - speed;
    s1.speedV = s1.speedV + 0.00001;

    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      prevz = z;
    }
  }


  void lines()
  {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);


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
    strokeWeight(1);

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);


    float r = map(z, 0, width/2, 4, 0);
    ellipse(sx, sy, r, r);
  }

  void move(int direction)
  {
    
    speed = 0.1;
    z = z - speed;

    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      prevz = z;
    }
    
    s1.speedV = - 1;
    //float sx = map(x , 0, 1, 0, width/2);
    //float sy = map(y, 0, 1, 0, height/2);
    //float r = map(z, 0, width/2, 4, 0);
    
     float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2); 
    float r = map(z, 0, width/2, 4, 0);
    ellipse(sx, sy, r, r);

    prevz = z;

    stroke(255);
    
    switch(direction)
    {
      case 1: 
      y = y + 0.1;
      
      case 2:
      x = x + 0.0001;
      
      case 3:
      x = x- 0.0001;
      
      case 4:
      y = y - 0.0001;
    }
    
    ellipse(sx, sy, r, r);
    if (y < height * - 0.5)
    {
      y = random(-height/2, height/2);
    }
    if (x < width * - 0.5)
    {
      x = random(-height/2, height/2);
    }
    
    if (y < height *  0.5)
    {
      y = random(-height/2, height/2);
    }
      if (x < width *  0.5)
    {
      x = random(-height/2, height/2);
    }
  }
}

float fs = 100;

class Planet extends star
{
  float z,r,s,count;
  
  Planet()
  {
    z = random(0,100);
    r = random(0,width - 200);
    s = random(0,height * 0.6 );
    
  }
  void drawP()
  {
    
    pushMatrix();
    noStroke();
    translate(r,s,z);
    fill(255,0,0);
    sphere(fs);
    popMatrix();
    
    if(move)
    {
      fs--;
      
    }
    
    if(fs > 200 || fs < -200)
    {
      fs = 0;
      z = random(0,100);
    r = random(0,width - 200);
    s = random(0,height * 0.6 );
    }
  }
}
  