void setup()
{
  size(500, 500);
  test();

  board = new Board(50);
}

Board board;
void draw()
{
   background(0);
  board.render();
  board.update();
  
  
  
}






void test()
{
  int count = 0;
 int  r = 10;
 int  c = 10;
  for (int row = r - 1; row <= r+1; row ++)
  {
    for (int col = c - 1; col <= c+1; col ++)
    {
      if ((! (row == r && col == c)))
      {
        count ++;
      }
    }
  }
}