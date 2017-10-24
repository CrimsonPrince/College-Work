void setup()
{
  fullScreen(P3D);
  stroke(255);
      background(0);
      
   for(int i = 0; i < 5000; i++)
  {
      ellipse(random(1,width), random(1, height), 1,1);
    
  }
}
float z = 0;

void draw()
{

}