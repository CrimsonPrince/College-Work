import ddf.minim.*;
Minim minim;
AudioPlayer hyper;

star[] stars = new star[4000];
float speed = 30;
int state = 2;
int sound = 0;

void setup() {
  fullScreen(P3D);

  for (int i = 0; i < stars.length; i++) 
  {
    stars[i] = new star();
  }
  minim = new Minim(this);
  hyper=minim.loadFile("Millennium falcon hyperdrive effect.mp3");
}


void draw() {

  switch(state)
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

  for (int i = 0; i < stars.length; i++)
  {
    stars[i].staticview();
  }


    if (keyPressed)
    {
      if (keyCode == UP)
      {
        for (int i = 0; i < stars.length; i++) 
        {
          stars[i].hyper();
          stars[i].lines();
        }
      }
      
      if (keyCode == DOWN)
      {
       for (int i = 0; i < stars.length; i++) 
        {
          stars[i].move();
        }
      }
      
    }
}

void soundplayer(AudioPlayer sound)
{
  
    if (sound == null)
    {
    return;
    }
    sound.rewind();
    sound.play(); 
   
}