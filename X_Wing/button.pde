class button {

  float tx, ty;

  button()
  {
    this.tx = width * 0.2;
    this.ty = height * 0.4;
  }

  void drawB()

  { 
    //Training Mode Button
    fill(255, 0, 0);
    ellipse(tx, ty, 100, 100);
  }
  
  void mousePressed()
  {
        println("Hi");
    
  }

}