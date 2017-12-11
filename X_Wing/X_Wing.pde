int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;


star[] stars = new star[4000];
float speed = 30;

void setup() {
  fullScreen(P3D);
  cols = w / scl;
  rows = h/ scl;


  for (int i = 0; i < stars.length; i++) 
  {
    stars[i] = new star();
  }
}

float turn = 1;
int location = 1;
void draw() {

switch(location)
  {
    case 1: 
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
  