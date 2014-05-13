//Gregory Guterman, Comp Prog 2 4/5, Assignment 10: Snowflake Catcher

int flakeCount = 1;
int catcherCount = 0;

Button button;
Snowflake[] flakes;
Catcher[] catchers = new Catcher[90000];
boolean[][] catcherBuffer = new boolean [300][300];

void setup()
{
  size(300,300);
  flakes = new Snowflake[100];
  button = new Button(250,270,50,30,color(255),color(0,0,255), 4, color(0,255,0), "Wind");
  fill(255);
  noStroke();
  flakes[0] = new Snowflake();
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      catcherBuffer[x][y] = false;
    }
  }
}

void draw()
{
  background(0);
  if(flakeCount == 99)
  {
  button.show();
  button.checkPress();
  }
  if(flakeCount < 99 && millis() % 5 == 0)
  {
    spawn();
  }
  makeCatchers();
  drawCatchers();
  for(int i = 0; i < flakeCount; i++)
  {
    if(flakes[i].isMoving == true)
    {
      flakes[i].move();
      flakes[i].wind();
    }
    flakes[i].show();
    flakes[i].checkCollision();
  }
  for(int j = 0; j < catcherCount; j++)
  {
    catchers[j].erase();
  }
}

void makeCatchers()
{
  if(mousePressed == true && mouseButton == LEFT)
  {
    catchers[catcherCount] = new Catcher(mouseX,mouseY);
    catcherCount++;
  }
}

void drawCatchers()
{
  for(int i = 0; i < 300; i++)
  {
    for(int j = 0; j < 300; j++)
    {
      if(catcherBuffer[i][j] == true)
      {
        fill(255,0,0);
        noStroke();
        ellipse(i,j, 3, 3);
      }
    }
  }
}

void spawn()
{
  flakes[flakeCount] = new Snowflake();
  flakeCount++;
}

class Snowflake
{
  int x,y;
  int windIntensity, timer, regularIntensity;
  boolean blowRight;
  boolean isMoving;

  Snowflake()
  {
    x = int(random(0,width));
    y = 0;
    regularIntensity = 3;
    isMoving = true;
    timer = 0;
  }
  void show()
  {
    fill(255);
    noStroke();
    ellipse(x,y,3,3);
  }
  void move()
  {
    y++;
    if(y > height)
    {
      y = 0;
    }
    if(x > width)
    {
      x = 0;
    }
    if(x < 0)
    {
      x = 300;
    }
  }
  void wind()
  {
    if(timer > 0)
    {
      timer--;
    }
    if(blowRight)
    {
      x += int(random(0,windIntensity));
    }
    else
    {
      x -= int(random(0,windIntensity));
    }
    if(timer == 0)
    {
      windIntensity = regularIntensity;
    }
  }
  void checkCollision()
  {
    if(get(x,y + 3) == color(255,0,0) || get(x,y + 3) == color(255) && x < 250 && y < 270)
    {
      isMoving = false;
    }

    else
    {
      isMoving = true;
    }
  }
}

class Catcher
{
  int x,y;

  Catcher(int xLoc, int yLoc)
  {
    x = xLoc;
    y = yLoc;
    if(x > 0 && y > 0 && x < 300 && y < 300)
    {
      catcherBuffer[x][y] = true;
    }
  }

  void erase()
  {
    if(mousePressed == true && mouseButton == RIGHT && dist(mouseX,mouseY,x,y) < 5)
    {
      catcherBuffer[x][y] = false;
    }
  }
}

class Button
{
  PFont font;
  int locationX;
  int locationY;
  int width1;
  int height1;
  int borderWeight;
  color backgroundColor;
  color borderColor;
  color textColor;
  boolean pressed;
  String words;
  int relaxPress;

  Button(int x, int y, int wide, int high, color bgColor, color brdrColor, int brdrWeight, color txtColor, String textInside)
  {
    locationX = x;
    locationY = y;
    width1 = wide;
    height1 = high;
    backgroundColor = bgColor;
    borderColor = brdrColor;
    borderWeight = brdrWeight;
    textColor = txtColor;
    words = textInside;
    font = loadFont("TimesNewRomanPSMT-12.vlw");
  }
  void show()
  {
    fill(borderColor);
    stroke(borderColor);
    rect(locationX,locationY,width1,height1);
    fill(backgroundColor);
    stroke(backgroundColor);
    rect(locationX + borderWeight, locationY + borderWeight, width1 - borderWeight*2, height1 - borderWeight*2);
    fill(0);
    textFont(font,12);
    text(words,locationX + (width1/5),(locationY + height1) - (height1 / 2));
  }
  void checkPress()
  {
    if(mousePressed == true && mouseButton == LEFT && mouseX > locationX && mouseX < locationX + width1 && mouseY > locationY && mouseY < locationY + height1 && abs(millis() - relaxPress) > 250)
    {
      relaxPress = millis();
      pressed();
    }
  }
  void pressed() //what to do when pressed
  {
    if(flakeCount == 99)
    {
      for(int i = 0; i < flakeCount; i++)
      {
        flakes[i].blowRight = !flakes[i].blowRight;
        flakes[i].windIntensity = 10;
        flakes[i].timer = 100;
      }
    }
  }
}



