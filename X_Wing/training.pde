class training
{
  void startT()
  {
    int i;
    ship ship1;
    ship1 = new ship();
    for (i = ships.size() - 1; i >= 0; i--)
    {
      ships.remove(i);
    }

    for (i=0; i < 3; i++)
    {
      ships.add(ship1);
    }

    for (i=0; i < 3; i++)
    {
      ship1=ships.get(i);
      ship1.drawtie(100, 100);
    }
  }
}