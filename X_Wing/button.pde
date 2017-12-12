class button {

  float tx, ty;
  float T = 0;
  
  
  
  button()
  {
    this.tx = width * 0.8;
    this.ty = height * 0.8;
  }

  void drawB()

  { 
    //Training Mode Button
    stroke(60, 56, 73);
    fill(255, 0, 0);
    ellipse(tx,ty,100,100);
  }

}