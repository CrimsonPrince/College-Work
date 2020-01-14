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

float fs = 0;

class Planet extends star
{
  float z,r,s,count;
  color c;
  float planetcount;
  int tmp;
  Data dataPlanet;
  
  Planet()
  {
    z = random(0,100);
    r = random(0,width - 200);
    s = random(0,height * 0.6 );
    c = color(random(255),random(255),random(255));
    planetcount = random(0,dataP.size());
    tmp = floor(planetcount);
    
  }
  void drawP()
  {
    
   // pushMatrix();
    noStroke();
    fill(c);
    //translate(r,s,z);
    //sphere(fs);
    ellipse(r,s,fs,fs);
    if(move)
    {
      fs++;
      
      if(r > width * 0.5)
      {
        r = r + 4;
      }
      if(r < width * 0.5)
      {
       r = r - 4; 
      }
      
    }
    
    if(fs > 150)
    {
      fs = - 150;
    }
    
    if(fs == -1)
    {
       z = random(0,100);
      r = random(0,width - 200);
      s = random(0,height * 0.6 );
      fs = 0;
      c = color(random(255),random(255),random(255));
      planetcount = random(0,dataP.size());
      tmp = floor(planetcount);
      
    }
    //popMatrix();
  }
  
  void planetdata()
  {
    
    if(dist(mouseX, mouseY, r , s ) < 150)
    {
      
      fill(255);
      textFont(f2,20);
      dataPlanet = dataP.get(tmp);
      text(dataPlanet.name,width * 0.5 ,height * 0.72);
      text(dataPlanet.terrain,width * 0.5 ,height * 0.75);
      text(dataPlanet.climate,width * 0.5 ,height * 0.78);
      text("Population", width * 0.48 ,height * 0.8);
      text(dataPlanet.population,width * 0.54 ,height * 0.8);
    }
  }
}
  