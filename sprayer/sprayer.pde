//Gregory Guterman, Comp Prog 2 4/5, Assignment 8: Sprayer
Sprayer spray1;
PImage sprayCan;
boolean [][] buffer;

void setup()
{
  background(0);
  buffer = new boolean[300][300];
  sprayCan = loadImage("sprayer.jpg");
  size(300,300);
  for(int x = 0; x < 300; x++)
  {
    for(int y = 0; y < 300; y++)
    {
      buffer[x][y] = false;
    }
  }
  spray1 = new Sprayer();
}

void draw()
{
  background(0);
  spray1.drawIt();
  for(int x = 0; x < 300; x++)
  {
    for(int y = 0; y < 300; y++)
    {
      if(buffer[x][y])
      {
        fill(255);
        ellipse(x,y,2,2);
      }
    }
  }

}

class Sprayer
{
  int x;
  int y;
  void drawIt()
  {
    image(sprayCan, mouseX - 23,mouseY - 59);
    if(mousePressed == true)
    {
      for(int i = 0; i < 10; i++)
      {
        float theta = random(11*PI/6,2*PI);  //random angle in radians
        int radius = int(random(0,50));
        int spitX = int(cos(theta)*radius);
        int spitY = int(sin(theta)*radius);
        x = mouseX + 5 + spitX;
        y = mouseY - 54  + spitY;
        if(x < 300 && x > 0 && y < 300 && y > 0)
        {
        buffer[x][y] = true;
        }
      }
    }
  }
}



