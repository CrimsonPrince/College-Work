import ddf.minim.*;
Minim minim;
AudioPlayer hyper;

star[] stars = new star[4000];
float speed = 30;
int state = 1;
int sound = 0;
PFont f;

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
  f = createFont("Starjhol.ttf", 16, true);
  
}


void draw() {

  switch(state)
  {
  case 1: 
  title();
  break;
  
  case 2:
    drawspace();
    movement();
    gui();
    break;
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
  stroke(60,56,73);
  strokeWeight(20);
  //ellipse(width * -0.5,height * 0.5, 20,20);
  fill(200);
  quad(width * 0.5, height * 0.5, width * 0.3, height * 0.1,  width * -0.3, height * 0.1, width * -0.5, height * 0.5);
  line(width * 0.3, height * 0.1, width *  0.5, height * - 0.3);
  line(width * -0.3, height * 0.1, width *  -0.5, height * - 0.3);
  
  
}

  float x = 500;
  float y = height;
  float z = 0;
  
void title()
{
  background(0);
  int fontsize = 20;
  rotateX(PI/4);
  stroke(0);
  strokeWeight(5);
  

  fill(229,177,58);
  textFont(f, fontsize);
  textAlign(CENTER);
  text("STARWARS", width/2, y, z);
  text("A long Time Ago,", width/2, y+100, z);
  text("In a Galaxy far far away...", width/2, y+150, z);

  y = y - 0.1;
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