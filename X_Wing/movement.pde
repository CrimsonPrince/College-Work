class move
{

  void movement()
  {
    int direction;

    if (keyPressed)
    {
      if (key == ' ')
      {
        for (int i = 0; i < stars.length; i++) 
        {
          move = true;
          stars[i].hyper();
          stars[i].lines();
        }
      }

      if (keyCode == UP)
      {
        for (int i = 0; i < stars.length; i++) 
        {
          move = true;
          direction = 2;
          stars[i].move(direction);
        }
      }

      if (keyCode == LEFT)
      {
        for (int i = 0; i < stars.length; i++) 
        {
          move = true;
          direction = 2;
          stars[i].move(direction);
        }
      }
      if (keyCode == RIGHT)
      {
        for (int i = 0; i < stars.length; i++) 
        {
          move = true;
          direction = 3;
          stars[i].move(direction);
        }
      }

      if (keyCode == DOWN)
      {
        for (int i = 0; i < stars.length; i++) 
        {
          move = true;
          direction = 4;
          stars[i].move(direction);
        }
      }
    }
    else
    {
      move = false;
    }
    popMatrix();
  }
}