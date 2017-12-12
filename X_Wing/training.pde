class training
{
  
  int i = 0;
  ship ship1;
  training()
  {
    ship1 = new ship();
  }
    
  void startT()
  {
    

    for (i = ships.size() - 1; i >= 0; i--)
    {
      ships.remove(i);
    }

    for (i=0; i < 3; i++)
    {
      ship1.x = random(0, width);
      ship1.y = random(0, 600);
      ships.add(ship1);
    }
    for (i=0; i < 3; i++)
    {
      ship1=ships.get(i);
      ship1.drawtie(ship1.x, ship1.y);
    }
  }

  void runT()
  {
    

    if (ships.size() != 0)
    {
      for (i = ships.size() - 1; i >= 0; i--)
      {
        ship1=ships.get(i);
        ship1.drawtie(ship1.x, ship1.y);
      }
    }
  }
}