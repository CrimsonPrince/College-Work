class training
{

  training()
  {
    x = width * 0.2;
    y = height * 0.4;
  }

  void drawT()
  {
    fill(255, 0, 0);
    ellipse(x, y, 100, 100);
  }
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
      ship1.drawtie(100,100);

      if (mousePressed)
      {
        if (mouseX > x && mouseX < x + 100 && mouseY > y && mouseY < y + 100)
        {
          state = 1;
        }
      }
    }
  }
}