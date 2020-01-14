float[] rainFall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"Jan", "Feb", "March", "April", "May"
  , "June", "July", "August", "Sept", "Oct", "Nov", "Dec" };

void setup()
{
  fullScreen();
  pie(rainFall, months);
}

void pie(float[] arr, String[] arr2)
{
  float total = 0;
  float x = height / 2;
  float y = width / 2;
  float HA = height / 2;
  float WA = width / 2;
  float tmp;
  float[] tmpa = new float[12];
  
  
  for(int i = 0; i < arr.length; i++)
  {
    total = total + arr[i];
  }
  
  for(int i=0; i < arr.length; i++)
  {
    tmp = arr[i];
    tmp = tmp / total;
    tmpa[i] = tmp;
  }
  
  for(float m:tmpa)
  {
   
  }
  

}