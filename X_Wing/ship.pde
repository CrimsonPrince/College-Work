class ship {
  
  float x,y = 0;
 
 void drawtie(float sx, float sy)
 {
  image(tie, x,y);
  x = sx;
  y = sy;
 };
}