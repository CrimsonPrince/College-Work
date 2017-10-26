int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;
float leftfly = 0;
float rightfly = 0;

float[][] terrain;

star[] stars = new star[4000];
float speed = 30;

void setup() {
  fullScreen(P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];


  for (int i = 0; i < stars.length; i++) 
  {
    stars[i] = new star();
  }
}

float turn = 1;
int location = 2;
void draw() {

switch(location)
  {
    case 1: 
    drawland();
    case 2:
    drawspace();
  }
}

void drawspace()
{
  background(0);
  translate(width/2, height/2);
  
  for(int i = 0; i < stars.length; i++)
  {
     stars[i].staticview();
  }
  
  if(keyPressed)
  {
    if(keyCode == UP)
    {
        
        for (int i = 0; i < stars.length; i++) 
        {
          stars[i].move();
          stars[i].create();
        }
        
      }
    }
}
  


void drawland()
{
  
  turn = 0;
  if (keyPressed)
  {
    if (keyCode == UP)
    {
    }
    if (keyCode == LEFT)
    {
    }
    if (keyCode == RIGHT)
    {
    }
  }

  float yoff = 0;

  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }



  background(0);
  stroke(255);
  noFill();

  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}