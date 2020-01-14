int game;
PFont f;   
ArrayList<ship> ships = new ArrayList<ship>(); 
int level = 1;
int[] bug = new int[101];

void setup()
{
  fullScreen();
  background(0);
  noCursor();
  f = createFont("PressStart2P.ttf",16,true);
  
  for(int i =0; i < bug.size; i++)
  {
    bug[i] = i;
  }
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
          float spacex;
          for(int i = 0; i < level;i++)
          {
            spacex = ships.get(i.spacex);
            if((playerx+pwidth/2) >= spacex && (playerx + pwidth/2) <= spacex+ bugwidth)
            {
              score++;
            }
          }
          stroke(255);
          line((playerx+pwidth/2),height - 50, (playerx+pwidth/2), 0);
        }
         
  }
  
    if (frameCount % frame == 0)
         {
           
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
    ships.add(new ship(bugid[i]));
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
    reset();
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