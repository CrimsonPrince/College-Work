import ddf.minim.*;
Minim minim;
AudioPlayer hyper;
AudioPlayer opening;

//normal global
star[] stars = new star[4000];
ArrayList<ship> ships = new ArrayList<ship>();
float speed = 30;
int state = 1;
int sound = 0;
boolean move;
//For use in title screen
float x = 500;
float y = height * 14;
float z = 0;

//font and text
PFont f;
PFont f2;
PImage logo;
PImage tie;
PImage cross;

//classes
control p;
crosshair aim;
training T1;
title title;
move moved;
button b;



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
  
  //initializing star
  for (int i = 0; i < stars.length; i++) 
  {
    stars[i] = new star();
  }
  
  //sound 
  minim = new Minim(this);
  hyper=minim.loadFile("Millennium falcon hyperdrive effect.mp3");
  opening=minim.loadFile("Op1.mp3");
  
  //fonts and text
  f = createFont("Starjhol.ttf", 16, true);
  f2 = createFont("News Gothic Bold.otf", 16, true);
  logo = loadImage("logo.png");
  tie = loadImage("tie2.gif");
  cross = loadImage("cross.png");
  cross.resize(70,70);
  
  //classes
  T1 = new training();
  aim = new crosshair();
  soundplayer(opening);
  title = new title();
  moved = new move();
  b = new button();
  p = new control();
}


void draw() {

  switch(state)
  {
  case 1: 
    title.titleS();
    break;

  case 2:
    drawspace();
    moved.movement();
    gui();
    aim.drawaim();
    b.drawB();
    break;
    
   case 3:
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
  stroke(60, 56, 73);
  strokeWeight(20);
  //ellipse(width * -0.5,height * 0.5, 20,20);
  fill(200);
  quad(width * 0.5, height * 0.5, width * 0.3, height * 0.1, width * -0.3, height * 0.1, width * -0.5, height * 0.5);
  line(width * 0.3, height * 0.1, width *  0.5, height * - 0.3);
  line(width * -0.3, height * 0.1, width *  -0.5, height * - 0.3);
  
  p.drawHex(0, height * 0.3, 200);
}