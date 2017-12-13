class ship {

  float x, y = 0;

  void drawtie(float sx, float sy)
  {
    if (move == false)
    {
      image(tie, x, y);
      x = sx;
      y = sy;
    }
    if (move)
    {

      if (ships.size() > 0)
      {
        ships.remove(0);
      }
    }
  };
}