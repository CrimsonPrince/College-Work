import ddf.minim.*;
import de.ilu.movingletters.*;



float bugX =0;
float bugY =0;
float playerspeed = 10;
float playerx=0;
int score;
float pwidth = 30;
float pheight = 10;
int frame = 60;
int game = 1;
PFont f;   
float bugwidth = 80;
int bug = 1;
int level = 1;
float[] spacex = new float[100];
float[] spacey = new float[100];

void setup(){
  fullScreen();
  background(0);
  noCursor();
  f = createFont("PressStart2P.ttf",16,true);
  for(int i = 0; i < 100; i++)
  {
    spacex[i] = random(0,width);
    spacey[i] = 60;
  }
}

void drawbug(){
    for(int i=0;i < bug;i++)
    {
      stroke(0);
      //rect(bugX, bugY,40,40);
      fill(255);
      arc(spacex[i], spacey[i]- 3, 40, 20, PI, TWO_PI);
      fill(0,0,255);
      ellipse(spacex[i], spacey[i], bugwidth, 10);
    }
}

void drawplayer(){
  fill(255, 0,0);
  stroke(0);
  rect(playerx,height - 50, pwidth, pheight);
 
}

void game()
{
  background(0);
  fill(255);
  textFont(f,20);
  text("LEVEL",width - 200,50);
  text("SHIPS",150, 50);
  
  drawbug();
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
          for(int i = 0; i < level;i++)
          {
            if((playerx+pwidth/2) >= spacex[i] && (playerx + pwidth/2) <= spacex[i]+ bugwidth)
            {
              score++;
              int tmp = i;
              bugdead(tmp);
              bug--;
            }
          }
          stroke(255);
          line((playerx+pwidth/2),height - 50, (playerx+pwidth/2), 0);
        }
         
  }
  
    if (frameCount % frame == 0)
         {
           for(int i=0; i < level; i++)
           {
             if(spacex[i] == 9999)
             {
               
             }
             else
             {
               spacex[i] += random(-200,200);
               spacey[i]+= 30;
               frame -= 1;
             }
           }
         }
    for(int i=0;i < level;i++)
    {
        if(spacex[i] < 0)
        {
          spacex[i] = random(0, 200);
        }
        
        if(spacex[i] + bugwidth > width && spacex[i] != 9999)
        {
          spacex[i] = random(width - 200, width);
        }
        
        if(spacex[i] + 10  > height - 50)
        {
          game = 3;
        }
    }
    if(bug == 0)
    {
      level++;
      bug = level;
      newlevel();
    }
}


void bugdead(int tmp)
{
  spacex[tmp] = 9999;
  spacey[tmp] = -9999;
  frame = 60;
}

void newlevel()
{
  for(int i = 0; i < level; i++)
  {
    spacex[i] = random(0, width);
    spacey[i] = 60;
  }
}

  

void draw(){
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
  
void reset()
{
  score = 0;
  level = 1;
  newlevel();
  playerx = width / 2;
  
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
    }
    
  }
}