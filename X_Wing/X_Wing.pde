import ddf.minim.*;
Minim minim;
AudioPlayer hyper;
AudioPlayer opening;

star[] stars = new star[4000];
float speed = 30;
int state = 1;
int sound = 0;
PFont f;
PFont f2;

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
  opening=minim.loadFile("Star Wars Episode IV Opening Crawl.mp3");
  f = createFont("Starjhol.ttf", 16, true);
  f2 = createFont("News Gothic Bold.otf", 16, true);
  soundplayer(opening);
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
  float y = height * 10;
  float z = 0;
  
void title()
{
  background(0);
  int fontsize = 45;
  rotateX(PI/4);
  stroke(0);
  strokeWeight(5);
  fill(229,177,58);
  textFont(f, fontsize);
  textAlign(CENTER);
  text("STARWARS", width/2, y, z);
  fontsize = 20;
  textFont(f2, fontsize);
  text("A long Time Ago,", width/2, y+100, z);
  text("In a Galaxy far far away...", width/2, y+150, z);
  text("It is a period of civil war.", width/2, y+200, z);
  text("Rebel spaceships, striking from a hidden base,", width/2, y+250, z);
  text("have won their first victory against the evil Galactic Empire. ", width/2, y+300, z);
  text("During the battle, Rebel spies managed to steal secret plans", width/2, y+350, z);
  text("to the Empire's ultimate weapon, the DEATH STAR,", width/2, y+400, z);
  text("an armored space station with enough power to destroy an entire planet. ", width/2, y+450, z);
  text("Pursued by the Empire's sinister agents, ", width/2, y+500, z);
  text("Princess Leia races home aboard her starship,", width/2, y+550, z);
  text("custodian of the stolen plans that can save her people", width/2, y+600, z);
  text("and restore freedom to the galaxy....", width/2, y+650, z);
  y = y - 0.4;
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