class ship {
  
  float x,y;
 
 void drawtie(float sx, float sy)
 {
  image(tie, x,y);
  x = sx;
  y = sy;
 };
}