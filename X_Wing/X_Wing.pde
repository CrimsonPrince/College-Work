import ddf.minim.*;
Minim minim;
AudioPlayer hyper;
AudioPlayer opening;
AudioPlayer laser;
AudioPlayer explosion;
AudioPlayer seekS;

//normal global
star[] stars = new star[4000];
ArrayList<ship> ships = new ArrayList<ship>();
float speed = 30;
int state = 1;
int sound = 0;
boolean move;
boolean seek;
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
  laser = minim.loadFile("laser.aiff");
  soundplayer(opening);
  
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
    aim.fire();
    b.drawB();
    T1.runT();
    break;
    
   case 3:
     break;
  }
}


void drawspace()
{
  background(0);
  pushMatrix();
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
  quad(0, height, width * 0.15, height * 0.6, width * 0.85, height * 0.6, width , height);
  line(width * 0.15, height * 0.6, 0 , 0);
  line(width * 0.85, height * 0.6, width, 0);
  
  p.drawHex(width/2, height * 0.8 , 200);
}


  void mousePressed()
  {
    //laser fire
    if(mouseY < height * 0.6)
    {
      aim.t = 1;
    }
     
    //training mode
    if (dist(mouseX, mouseY,b.tx,b.ty)<=60)
    {
      T1.startT();
    }
  }