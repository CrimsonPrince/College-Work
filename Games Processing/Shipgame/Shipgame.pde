int game = 1;
PFont f;   
ArrayList<ship> ships = new ArrayList<ship>(); 
int level = 4;
int score;
int playerx;
int pwidth = 30;
int pheight = 10;
int frame = 60;
int playerspeed = 10;
int bugwidth = 80;

void setup()
{
  fullScreen();
  background(0);
  noCursor();
  f = createFont("PressStart2P.ttf",16,true);
  playerx = width/2;
}

void draw()
{
  background(0); //Transition Background
  switch(game)
  {
    case 1: 
      menu();
      break;
      
    case 2:
      game();
      break;
    case 3:
      gameover();
      break;
      
  }
  
}

void game()
{
  drawplayer();
  
          ship alien;
          
           for(int i = 0; i < ships.size();i++)
            {  
              alien = ships.get(i);
              alien.drawship();
              
            }
  
  if(keyPressed)
  {
        if(keyCode == LEFT)
        {
          playerx = playerx - playerspeed;
        }
        if(keyCode == RIGHT)
        {
          playerx = playerx + playerspeed;
        }
        if(keyCode == UP)
        {
          
          float shipx;
          for(int i = 0; i < ships.size();i++)
          {
            alien = ships.get(i);
            shipx = alien.shipx;
            if((playerx+pwidth/2) >= shipx && (playerx + pwidth/2) <= shipx + bugwidth)
            {
              score++;
              ships.remove(i);
            }
          }
          stroke(255);
          line((playerx+pwidth/2),height - 50, (playerx+pwidth/2), 0);
        }
         
  }
  
     if (frameCount % frame == 0)
     {
          
          float shipx;
           for(int i = 0; i < ships.size();i++)
            {  
              alien = ships.get(i);
              alien.shipmove();
              
            }
     }
         
}

void drawplayer(){
  fill(255, 0,0);
  stroke(0);
  rect(playerx,height - 50, pwidth, pheight);
 
}

void newlevel()
{
  for(int i = 0; i < level; i++)
  {
    ships.add(new ship());
  }
  
}



void gameover()
{
  float linespace = height * 0.15;
  float space = width * 0.15;
  float fontsize2;
  fontsize2 = (((height + width) /2) * 0.1);
  textFont(f,fontsize2);                  // STEP 3 Specify font to be used
  fill(255);  
  textAlign(CENTER);// STEP 4 Specify font color 
  text("GAME OVER",width/2,height/2); 
  text("Score:", width/2, height/2 + linespace);// STEP 5 Display Text
  text(score, width/2 + space, height/2 + linespace);
 
  if(keyPressed)
  {
    if(key == ENTER || key == RETURN || keyCode == 49 || key == ' ')
    {
    score = 0;
    level = 0;
    newlevel();
    game = 1;
    }
    
  }
}

void menu()
{
  float linespace = height * 0.15;
  float space = width * 0.15;
  float fontsize2;
  fontsize2 = (((height + width) /2) * 0.1);
  textFont(f,fontsize2);                  // STEP 3 Specify font to be used
  fill(255);
  
  textAlign(CENTER);// STEP 4 Specify font color 
  text("Bug Splat", width/2, height/2);
  text("Arthur Coll", width/2, height/2 + linespace);
  textFont(f,fontsize2 * 0.2);
  text("Ready Player One", width/2, height/2 + linespace * 2);
  
  
   
  if(keyPressed)
  {
    if(key == ENTER || key == RETURN || keyCode == 49 || key == ' ')
    {
    game = 2;
    newlevel();
    }
    
  }
}