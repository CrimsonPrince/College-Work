class crosshair{
  
  void drawaim()
  {
    if(mouseY < height * 0.6)
    {
      cursor(cross);
    }
    else
    {
     cursor(ARROW); 
    }
    
  }
 
  
}