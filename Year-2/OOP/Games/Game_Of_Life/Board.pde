class Board
{
  boolean[][] current;
  boolean[][] next;

  int size;

  float cellSize;

  Board(int size)
  {
    this.size = size;
    current = new boolean[size][size];
    next = new boolean[size][size];
    cellSize = width / (float) size;
    randomise();
  }

  void render()
  {
    for (int row = 0; row < size; row ++)
    {
      for (int col = 0; col < size; col ++)
      {
        if (current[row][col])
        {
          fill(0, 255, 0);
        } else
        {
          fill(0);
        }
        float x = map(col, 0, size, 0, width);
        float y = map(row, 0, size, 0, height);
        rect(x, y, cellSize - 1, cellSize - 1);
      }
    }
  }

  void randomise()
  {
    for (int row = 0; row < size; row ++)
    {
      for (int col = 0; col < size; col ++)
      {
        int dice = (int) random(0, 2);
        /*if (dice == 1)
         {
         current[row][col] = true;
         }
         */
        current[row][col] = (dice == 1);
      }
    }
  }

  // Methods for you guys to implement! 
  // Return true if the cell at row and col is true
  // Do bounds checking in this method to make sure row and col
  // Have valid ranges
  boolean isOn(int row, int col)
  {
    boolean death = false;
    if (current[row][col] == true && row <= 50 && col <= 50)
    {
      death = count(row, col);
      return death;
    } else 
    {
      return death;
    }
  }

  // Count the number of live cells around row and col
  // and return it
  // You can use the method above
  // This could be a nested loop
boolean count(int r, int c)
  {
    int count = 0;
    boolean dead = false;

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
    if (count > 3 || count < 2)
      {
        dead = false;
      }
      return dead;
  }

    // This method should apply the rules to each cell
    // Dont forget to use the current board to do the calculations
    // but update the next board
    // Then swap them
    // Also dont forget to call this method from draw() in the main sketch
      void update()
      {
        for (int i=0; i < size; i++)
        {
          for (int j=0; j<size; j++)
          {
            if(isOn(i,j))
            {
              next[i][j] = true;
              
            }
          }
        }
        current = next;
      }
}