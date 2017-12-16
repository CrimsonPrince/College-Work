class title
{




  void titleS()
  {

    background(0);
    int fontsize = 45;
    rotateX(PI/4);
    stroke(0);
    strokeWeight(5);
    fill(229, 177, 58);
    textFont(f, fontsize);
    textAlign(CENTER);
    image(logo, width/2 - 100, y-200, 200, 200 );
    //text("STARWARS", width/2, y, z);
    fontsize = 20;
    textFont(f2, fontsize);
    text("A long Time Ago,", width/2, y+100, z);
    text("In a Galaxy far far away...", width/2, y+150, z);
    text("It is a period of civil war.", width/2, y+200, z);
    text("Rebel spaceships, striking from a hidden base,", width/2, y+250, z);
    text("have won their first victory against the evil Galactic Empire. ", width/2, y+300, z);
    text("During the battle, Rebel spies managed to steal secret plans", width/2, y+350, z);
    text("to the Empire's ultimate weapon, the DEATH STAR,", width/2, y+400, z);
    text("an armored space station with enough power to destroy an entire planet. ", width/2, y+450, z);
    text("Pursued by the Empire's sinister agents, ", width/2, y+500, z);
    text("Princess Leia races home aboard her starship,", width/2, y+550, z);
    text("custodian of the stolen plans that can save her people", width/2, y+600, z);
    text("and restore freedom to the galaxy....", width/2, y+650, z);
    y = y - 0.4;

    for (int i = 0; i < stars.length; i++)
    {
      stars[i].staticview();
    }

    if (keyPressed)
    {

      if (key == ' ')
      {
        state = 2;
      }
    }
  }
}