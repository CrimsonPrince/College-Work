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
int ammo = 3;
boolean move;
boolean seek;
//For use in title screen
float x = 500;
float y = height * 14;
float z = 0;
int kill;

//font and text
PFont f;
PFont f2;
PImage logo;
PImage tie;
PImage cross;
PImage xwing;

//classes
control p;
crosshair aim;
training T1;
title title;
move moved;
button b;
speed s1;
Radar radar;
shipstatus status;


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
  explosion = minim.loadFile("explosion.aiff");
  seekS = minim.loadFile("seek.aiff");
  soundplayer(opening);

  //fonts and text
  f = createFont("Starjhol.ttf", 16, true);
  f2 = createFont("News Gothic Bold.otf", 16, true);
  logo = loadImage("logo.png");
  tie = loadImage("tie2.gif");
  cross = loadImage("cross.png");
  xwing = loadImage("xwing.gif");
  cross.resize(70, 70);

  //classes
  T1 = new training();
  aim = new crosshair();
  title = new title();
  moved = new move();
  b = new button();
  p = new control();
  s1 = new speed();
  radar = new Radar(width * 0.8, height * 0.85, 100, 0.5, color(0, 255, 0));
  status = new shipstatus();
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
    T1.runT();
    aim.drawaim();
    aim.fire();
    b.drawB();
    s1.displays();
    radar.render();
    radar.update();
    status.displaystatus();
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
  quad(0, height, width * 0.15, height * 0.6, width * 0.85, height * 0.6, width, height);
  line(width * 0.15, height * 0.6, 0, 0);
  line(width * 0.85, height * 0.6, width, 0);

  p.drawHex(width/2, height * 0.8, 200);

  if (seek)
  {
    fill(255);
    textSize(30);
    text("TIE FIGHTER", width/2 + 10, height * 0.8 -100);
    image(tie, width/2 -45, height * 0.8 -30, 100, 100);
    textSize(30);
    text("Shield", width/2 + 120, height * 0.8);
    text("0%", width/2 + 120, height * 0.8 + 30);
    text("Firepower", width/2 - 110, height * 0.8);
    text("100%", width/2 - 120, height * 0.8 + 30);
    soundplayer(seekS);
    seek = false;
    if (aim.t == 1)
    {
      if (ships.size() > 0)
      {
        ships.remove(0);
        soundplayer(explosion);
        kill++;
      }
    }
  }
}


void mousePressed()
{
  if (move == false)
  {
    //laser fire
    if (mouseY < height * 0.6)
    {
      if (ammo > 0)
      {
        aim.t = 1;
        ammo--;
      }
    }

    //training mode
    if (dist(mouseX, mouseY, b.tx, b.ty)<=60)
    {
      T1.startT();
    }
  }
}