int game;

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
  
  
}


void gameover()
{
  
}