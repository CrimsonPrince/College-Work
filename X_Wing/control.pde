void drawHex(float x, float y, float gs) {
  beginShape();
  for(int i=0;i<6;i++){
    float angle = i * 2 * PI / 6;
    vertex(x + gs*cos(angle),y + gs*sin(angle));
  }
  endShape(CLOSE);
}