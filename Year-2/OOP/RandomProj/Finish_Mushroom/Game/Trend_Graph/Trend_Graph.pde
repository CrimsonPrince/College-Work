float[] rainFall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"Jan", "Feb", "March", "April", "May"
  , "June", "July", "August", "Sept", "Oct", "Nov", "Dec" };

void setup()
{
  fullScreen();
  background(0);
  drawaxis(rainFall, months);
  draw(rainFall, months);
  
 

}




void drawaxis(float[] arr, String[] arr2)
{
  int alength = arr.length + 1;  //Length of the Array + 1 in order to insert 0 on Axis
  int alength2 = arr2.length;
  float lined = 50;  //Gap from the Edges of the screen for Astethics 
  float maxheight = (height-lined * 2)/ alength;
  float maxwidth = (width - lined * 2)/ alength2;
  
  stroke(255);
  line(lined, 0 + lined,lined,height - lined);
  line(lined,height - lined,width,height-lined);
  arr = sort(arr);
  
  
    for(int i=0; i < arr.length +1; i++)
    {
      float x = (height - lined) - maxheight * i ;
      if(i > 0)
      {
        line(lined,  x, lined - 10, x);
        String str1 = "" + arr[i - 1];
         text(str1 ,lined - 40, x);
      }
      else
      {
        line(lined,  x, lined - 10, x);
        text("0", lined - 40, x);
      }
        
 
    }

  for(int i=0; i < arr.length ; i++)
{
  
  float x = (0 + lined) + maxwidth * i ;
  line(x,  height - lined, x, height - lined + 10);
  text(arr2[i] ,x, height - 30); 
}

}


void draw(float[] arr, String[] arr2)
{
  
  int alength = arr.length + 1;  //Length of the Array + 1 in order to insert 0 on Axis
  int alength2 = arr2.length;
  float lined = 50;  //Gap from the Edges of the screen for Astethics 
  float maxheight = (height-lined * 2)/ alength;
  float maxwidth = (width - lined * 2)/ alength2;
  float prevx = arr[0];
  float[] arrsort = sort(arr);
  float heighta = 0;
  float x = 0;
  float x1 = 50;
  float y = 0;
  float y1 = (height - lined);
  for(int i = 0; i < arr.length;i++)
  {
    
      for(int j = 0; j < arr.length;j++)
      {
        if(arr[j] == arrsort[j])
         {
          y = height - (maxheight * j);
         }
      }
      x = (i + 1) * maxwidth;
      line(x1, y1, x,y);
      x1 = x;
      y1 = y;
    
  }
}