//Gregory Guterman, Comp Prog 2 4/5, Assignment 11: Snake
int level = 1;
Snake snake1;
Obstacle[] obstacles;
boolean oneTime;
int foodEaten = 0;
Food fodder;
boolean lose = false;
int relax = 100;
boolean doorUp = false;
boolean oneTime2 = false;
PImage[] bg;
int bgX = 0;
int bgY = -50;
boolean bgMoving = false;
PFont font;
int instructTime = 100;
int opacity = 255;
int foodForSecond,foodForThird;

void setup()
{
  foodForSecond = 3;
  foodForThird = 8;
  bg = new PImage[10];
  font = loadFont("Jokerman-Regular-48.vlw");
  textFont(font);
  bg[0] = loadImage("level1.bmp");
  fodder = new Food();
  snake1 = new Snake(6,RIGHT,100,100);
  obstacles = new Obstacle[10];
  size(800,200);
  frameRate(15);
}
void draw()
{
  // println("Snake is at " + snake1.segments[0].x + " , " + snake1.segments[0].y);
  // println("Food is at " + fodder.x + " , " + fodder.y);
  if(lose == false)
  {
    image(bg[level - 1],bgX,bgY);
    if(level == 1)
    {
      level1();
    }
    else if(level == 2)
    {
      level2();
    }
    else if(level == 3)
    {
      level3();
    }
    for(int i = 0; i < snake1.currLength; i++)
    {
      snake1.segments[i].collision();
      snake1.segments[i].show();
    }
    snake1.move();
    fodder.show();
    fodder.collision();
    moveBg();
    if(instructTime > 0)
    {
      instructions();
      instructTime--;
    }
    else
    {
      opacity = 255;
    }
  }
}

void instructions()
{
  if(level == 1)
  {
    if(foodEaten == foodForSecond)
    {
      fill(255,255,255,opacity);
      text("You've eaten enough!\n Get to a bunny ASAP",0,50);
      opacity -= 3;
    }
    else if(lose == false)
    {
      fill(255,255,255,opacity);
      text("WASD to move. Don't bother the\n      bunnies or the scary badger\n Find and eat the blue food",0,50);
      opacity -= 3;
    }
  }
  else if(level == 2)
  {
    if(lose == false && foodEaten < foodForThird)
    {
      fill(255,255,255,opacity);
      text("Level Two. Don't bother the\n      bunnies or the scary badger",0,50);
      opacity -= 3;
    }
    else if(level == 2 && lose == false && foodEaten == foodForThird)
    {
      fill(255,255,255,opacity);
      text("You've eaten enough!\n Get to a bunny ASAP",0,50);
      opacity -= 3;
    }
  }
  if(lose == true)
  {
    fill(255);
    text("You Lose! Bwa Ha Ha",0,50);
  }
}

void moveBg()
{
  if(snake1.segments[0].x > 400 && snake1.direction == RIGHT && bgX > -400)
  {
    bgX -= snake1.speed;
    fodder.x -= snake1.speed;
    obstacles[0].x -= snake1.speed;
    bgMoving = true;
  }
  else if(snake1.segments[0].x < 400 && snake1.direction == LEFT && bgX < 0)
  {
    bgX += snake1.speed;
    fodder.x += snake1.speed;
    obstacles[0].x += snake1.speed;
    bgMoving = true;
  }
  else if(snake1.segments[0].y < 100 && snake1.direction == UP && bgY < 10)
  {
    bgY += snake1.speed;
    fodder.y += snake1.speed;
    obstacles[0].y += snake1.speed;
    bgMoving = true;
  }
  if(snake1.segments[0].y > 100 && snake1.direction == DOWN && bgY > -90)
  {
    bgY -= snake1.speed;
    fodder.y -= snake1.speed;
    obstacles[0].y -= snake1.speed;
    bgMoving = true;
  }
  else
  {
    bgMoving = false;
  }
}

void level1()
{
  if(oneTime == false)
  {
    obstacles[0] = new Obstacle();
    oneTime = true;
  }
  else
  {
    obstacles[0].show();
    obstacles[0].move();
    if(foodEaten == foodForSecond && oneTime2 == false)
    {
      instructTime = 200;
      oneTime2 = true;
    }
  }
}

void level2()
{
  if(level == 2)
  {
    obstacles[0].show();
    obstacles[0].move();
    if(foodEaten == foodForThird)
    {
      instructTime = 200;
    }
  }
}

void level3()
{
  if(level == 3)
  {
    obstacles[0].show();
    obstacles[0].move();
  }
}

void keyPressed()
{
  if(key == 'w' && snake1.direction != DOWN)
  {
    snake1.direction = UP;
  }
  else if(key == 'a' && snake1.direction != RIGHT)
  {
    snake1.direction = LEFT;
  }
  else if(key == 's' && snake1.direction != UP)
  {
    snake1.direction = DOWN;
  }
  else if(key == 'd' && snake1.direction != LEFT)
  {
    snake1.direction = RIGHT;
  }
}

class Segment
{
  int x,y;
  int size;
  color bodyColor;

  Segment()
  {
    if(get(400,100) == -8372224 || get(400,100) == color(0))
    {
      x = 400;
      y = 100;
    }
    else if(get(200,50) == -8372224 || get(200,50) == color(0))
    {
      x = 200;
      y = 50;
    }
    else if(get(600,150) == -8372224 || get(200,50) == color(0))
    {
      x = 600;
      y = 150;
    }
    size = 5;
    bodyColor = color(int(random(255)),int(random(255)),int(random(255)));
  }
  void show()
  {
    noStroke();
    fill(bodyColor);
    rect(x,y,size,size);
  }
  void collision()
  {
    if(relax > 0)
    {
      relax--;
    }
    else if(get(x + 2,y + 2) != bodyColor && get(x + 2,y + 2) != color(0,0,255) && get(x + 2,y + 2) != color(0) && get(x + 2,y + 2) != color(255) && get(x + 2,y + 2) != -8372224)
    {
      if(level == 1 && foodEaten == foodForSecond && x > bgX + 290 && x < bgX + 360 && y > bgY + 90 && y < bgY + 160 || level == 1 && foodEaten == foodForSecond && x > bgX + 890 && x < bgX + 960 && y > bgY + 140 && y < bgY + 210)
      {
        bg[1] = loadImage("level2.bmp");
        bgX = 0;
        bgY = -50;
        opacity = 255;
        instructTime = 200;
        level = 2;
        obstacles[0].x = 600;
        obstacles[0].y = 150;
        while(get(fodder.x,fodder.y) != -16777216 && get(fodder.x,fodder.y) != -8372224)
        {
          fodder.x = int(random(bgX + 100, bgX + 1100));
          fodder.y = int(random(bgY + 80, bgY + 230));
        }
        foodEaten++;
        fodder.shown = true;
        snake1 = new Snake(6,RIGHT,0,100);
        snake1.segments[0].x = 50;
        relax = 30;
        println("level2");
      }
      else if(level == 2 && foodEaten == foodForThird && x > bgX + 240 && x < bgX + 310 && y > bgY + 40 && y < bgY + 110 || level == 2 && foodEaten == foodForThird && x > bgX + 240 && x < bgX + 310 && y > bgY + 190 && y < bgY + 260 || level == 2 && foodEaten == foodForThird && x > bgX + 490 && x < bgX + 560 && y > bgY + 90 && y < bgY + 210 || level == 2 && foodEaten == foodForThird && x > bgX + 740 && x < bgX + 810 && y > bgY + 40 && y < bgY + 110 || level == 2 && foodEaten == foodForThird && x > bgX + 740 && x < bgX + 810 && y > bgY + 190 && y < bgY + 260)
      {
        bg[2] = loadImage("level3.bmp");
        bgX = 0;
        bgY = -50;
        foodEaten++;
        opacity = 255;
        instructTime = 200;
        obstacles[0].x = 600;
        obstacles[0].y = 150;
        while(get(fodder.x,fodder.y) != -16777216 && get(fodder.x,fodder.y) != -8372224)
        {
          fodder.x = int(random(bgX + 80, bgX + 1100));
          fodder.y = int(random(bgY + 80, bgY + 200));
        }
        fodder.shown = true;
        snake1 = new Snake(6,RIGHT,0,100);
        snake1.segments[0].x = 50;
        relax = 30;
        level = 3;
        println("level3");
      }
      else if(relax > 0)
      {
        relax--;
      }
      else
      {
        lose = true;
        instructTime = 200;
      }
    }
    else if(get(x + 2,y + 2) == color(255))
    {
      level = 2;
      oneTime = false;
      oneTime2 = false;
    }
  } 
}

class Snake
{
  Segment[] segments;
  int direction;
  color bodyColor;
  int currLength;
  int maxLength;
  int speed;

  Snake(int startLength, int startDirection, int headX, int headY)
  {
    segments = new Segment[100];
    bodyColor = color(0,255,0);
    currLength = startLength;
    direction = startDirection;
    segments[0] = new Segment();
    for(int i = 1; i < startLength; i++)
    {
      segments[i] = new Segment();
    }
    speed = segments[0].size + 2;
  }

  void move()
  {
    if(bgMoving == false)
    {
      for(int i = currLength - 1; i > 0; i--)
      {
        segments[i].x = segments[i - 1].x;
        segments[i].y = segments[i - 1].y;
      }
      if(direction == UP)
      {
        segments[0].y -= speed;
      }
      else if(direction == DOWN)
      {
        segments[0].y += speed;
      }
      else if(direction == LEFT)
      {
        segments[0].x -= speed;
      }
      else if(direction == RIGHT)
      {
        segments[0].x += speed;
      }
    }
    else
    {
      for(int i = currLength - 1; i > 0; i--)
      {
        segments[i].x = segments[i - 1].x;
        segments[i].y = segments[i - 1].y;
      }
      if(direction == UP)
      {
        segments[0].y -= segments[0].size;
      }
      else if(direction == DOWN)
      {
        segments[0].y += segments[0].size;
      }
      else if(direction == LEFT)
      {
        segments[0].x -= segments[0].size;
      }
      else if(direction == RIGHT)
      {
        segments[0].x += segments[0].size;
      }
    }
  }
}

class Obstacle
{
  float x,y;
  PImage face;
  float moveX,moveY;

  Obstacle()
  {
    x = 700;
    y = 50;
    face = loadImage("monster.bmp");
  }

  void move()
  {
    moveX = (snake1.segments[0].x - x) * .02;
    moveY = (snake1.segments[0].y - y) * .02;
    x += moveX;
    y += moveY;
  }

  void show()
  {
    image(face,x,y);
  }
}

class Food
{
  int x,y;
  boolean shown;

  Food()
  {
    shown = true;
  }

  void show()
  {
    if(foodEaten  == foodForSecond && level == 1 || foodEaten  == foodForThird && level == 2)
    {
      shown = false;
    }
    else
    {
      shown = true;
    }
    if(shown == true)
    {
      fill(0,0,255);
      ellipse(x,y,15,15);
    }
  }
  void collision()
  {
    if(x > bgX + 1150 || x < bgX + 50 || y < bgY + 50 || y > bgY + 250)
    {
      if(get(x,y) != -16777216 && get(x,y) != -8372224)
      {
        x = int(random(bgX +100, bgX +1100));
        y = int(random(bgY + 80, bgY +230));
      }
    }
    if(dist(snake1.segments[0].x,snake1.segments[0].y,x,y) < 15 && foodEaten != foodForSecond && foodEaten != foodForThird)
    {
      foodEaten++;
      if(foodEaten != foodForSecond && foodEaten != foodForThird)
      {
        snake1.segments[snake1.currLength] = new Segment();
        snake1.currLength++;
      }
      do
      {
        x = int(random(bgX +90, bgX +1100));
        y = int(random(bgY + 80, bgY +230));
      }
      while(get(x,y) != 0 && get(x,y) != -16777216 && get(x,y) != -8372224);
    }
  }
}





