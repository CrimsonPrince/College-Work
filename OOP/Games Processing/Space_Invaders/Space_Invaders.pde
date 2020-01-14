int game = 1;

void setup(){
 fullScreen();
 noCursor();
 background(0);
  
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

void menu()
{
  
  
}

void game()
{
  float playerx = width/2;
  float playerspeed = 30;
  
  if (keyPressed)
  {
    if (keyCode == LEFT)
    {
      playerx = playerx - playerspeed;
      
      if(playerx > width)
      {
        playerx = width;
      }
    }
    if (keyCode == RIGHT)
    {
      playerx = playerx + playerspeed;
     
      if(playerx < 0)
      {
        playerx = 0;
      }
    }
    if (keyCode == UP)
    {
      void projectile(playerx);
      
    }
  }
  
  drawplayer(playerx);
  
  
}


void gameover()
{
  
}

void drawplayer(float playerx)
{
  rect(playerx -10, 50, 20, 50);
}