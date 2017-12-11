import ddf.minim.*;
Minim minim;
AudioPlayer hyper;

star[] stars = new star[4000];
float speed = 30;
int state = 2;
int sound = 0;
PShape s;

void soundplayer(AudioPlayer sound)
{
  
    if (sound == null)
    {
    return;
    }
    sound.rewind();
    sound.play(); 
   
}

void setup() {
  fullScreen(P3D);

  for (int i = 0; i < stars.length; i++) 
  {
    stars[i] = new star();
  }
  minim = new Minim(this);
  hyper=minim.loadFile("Millennium falcon hyperdrive effect.mp3");
  
  s = createShape();
  s.beginShape();
  s.vertex(width* 0.5, height * 0.5);
  s.vertex(width * 0.3, height * 0.3);
  s.vertex(width * -0.3, height * -0.3);
  s.vertex(width* -0.5, height * -0.5);
  s.endShape();
}


void draw() {

  switch(state)
  {
  case 1: 
  case 2:
    drawspace();
    movement();
    gui();
  }
}

void drawspace()
{
  background(0);
  translate(width/2, height/2);
  
  
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].staticview();
  }
   
}

void gui()
{
  stroke(200);
  ellipse(100,height * 0.5, 20,20);
  shape(s,100,100);
  
  
}

void movement()
{
  int direction;
  
  if (keyPressed)
    {
      if (key == ' ')
      {
        for (int i = 0; i < stars.length; i++) 
        {
          stars[i].hyper();
          stars[i].lines();
        }
      }
      
      if (keyCode == UP)
      {
       for (int i = 0; i < stars.length; i++) 
        {
          direction = 2;
          stars[i].move(direction);
        }
      }
      
      if (keyCode == LEFT)
      {
       for (int i = 0; i < stars.length; i++) 
        {
          direction = 2;
          stars[i].move(direction);
        }
      }
      if (keyCode == RIGHT)
      {
       for (int i = 0; i < stars.length; i++) 
        {
          direction = 3;
          stars[i].move(direction);
        }
      }
      
      if (keyCode == DOWN)
      {
       for (int i = 0; i < stars.length; i++) 
        {
          direction = 4;
          stars[i].move(direction);
        }
      }
      
    } 
}