//Gregory Guterman, Comp Prog 2 4/5, Assignment 9: Circular Motion

Prey[] prey;
Predator predator;
Missile[] missiles;
float easing = .04;
int missileCount = -1;
int preyCount = 1;
int relax = 50;
int lives = 5;
int hitRecovery2 = 0;
int highScore = 0;
boolean flash = false;
int score;
boolean once = false;
PFont font;

void setup()
{
  font = loadFont("Calibri-12.vlw");
  textFont(font);
  size(500,500);
  prey = new Prey[5];
  predator = new Predator();
  missiles = new Missile[1000001];
  frameRate(15);
  prey[0] = new Prey(0,int(228 * cos(PI)) + height/2,int(228 * sin(PI)) + height/2,PI);
  noStroke();
}

void draw()
{
  if(lives > 0)
  {
    preySettings();
    fill(255,255,255,150);
    rect(0,0,width,height);
    if(preyCount < 5)
      makeMorePrey();
    for(int i = 0; i < preyCount; i++)
    {
      prey[i].move();
      prey[i].show();
      prey[i].fire();
    }
    predator.move();
    predator.show();
    if(missileCount >= 0)
    {
      for(int i = 0; i <= missileCount; i++)
      {
        missiles[i].show();
        missiles[i].move();
        missiles[i].collision();
      }
    }
    showLives();
    showScore();
  }
  else
  {
    gameOver();
  }
}

void showScore()
{
  fill(0);
  text(score,width - 50,20);
}

void preySettings()
{
  if(preyCount == 1)
  {
    prey[0].firingSpeed = 2;
    easing = .04;
  }
  else if(preyCount == 2)
  {
    for(int i = 0; i < preyCount; i++)
    {
      prey[i].firingSpeed  = 5;
      easing = .05;
    }
  }
  else if(preyCount == 3)
  {
    for(int i = 0; i < preyCount; i++)
    {
      prey[i].firingSpeed  = 15;
      easing = .07;
    }
  }
  else if(preyCount == 4)
  {
    for(int i = 0; i < preyCount; i++)
    {
      prey[i].firingSpeed  = 25;
      easing = .1;
    }
  }
  else if(preyCount == 5)
  {
    for(int i = 0; i < preyCount; i++)
    {
      prey[i].firingSpeed  = 30;
      easing = .15;
    }
  }
}

void keyPressed()
{
  if(key == ENTER && lives == 0)
  {
    Prey[] prey;
    prey = new Prey[5];
    prey[0] = new Prey(0,int(228*cos(PI)) + height/2, int(228*sin(PI)) + height/2, PI);
    Missile[]missiles;
    missileCount = -1;
    missiles = new Missile[1000001];
    preyCount = 1;
    lives = 5;
    hitRecovery2 = 0;
    score = 0;
    once = false;
  }
}

void gameOver()
{
  if(once == false)
  {
    if(score > highScore)
    {
      highScore = score;
    }
    text("Game Over\nPress Enter To Play Again!\nYour Highest Score So Far Is " + highScore, width - 300, height/2);
    once = true;
  } 
}

void showLives()
{
  int life = lives;
  if(flash == false)
  {
    fill(0,0,255,40);
  }
  else
  {
    if(int(random(2)) == 0)
    {
      fill(0,0,255,40);
    }
    else
    {
      fill(255);
    }
  }
  for(int i = 450; i < 500; i+=10)
  {
    if(life > 0)
    {
      ellipse(i,5,10,10);
      life--;
    }
  }
}

void makeMorePrey()
{
  if(relax != 0)
  {
    relax--;
  }
  else if(second() % 15 == 0)
  {
    float theta = random(0,2*PI);
    int x = int(228 * cos(theta)) + width/2;
    int y = int(228 * sin(theta)) + height/2;
    prey[preyCount] = new Prey(preyCount,x,y,theta);
    preyCount++;
    relax = 20;
  }
}

class Prey
{
  int x;
  int y;
  int size, radius;
  float theta,speed;
  int firingSpeed;
  int id;

  Prey(int ident, int initialX, int initialY, float thet)
  {
    id = ident;
    theta = thet;
    radius = 228;
    size = 50;
    speed = random(.04,.08);
    firingSpeed = 15;
  }
  void move()
  {
    theta += speed;
  }
  void show()
  {
    x = int(radius * cos(theta)) + width/2;
    y = int(radius * sin(theta)) + height/2;
    fill(0,0,255,40);
    ellipse(x,y,size,size);
  }
  void fire()
  {
    if(int(random(firingSpeed)) ==  1)
    {
      missileCount++;
      missiles[missileCount] = new Missile(prey[id].x,prey[id].y,predator.x,predator.y);
      score+= preyCount;
    }
  }
}

class Predator
{
  int size;
  float deltaX, deltaY,x,y, angleX,angleY;

  Predator()
  {
    size = 50;
    x = width/2;
    y = height/2;
  }
  void show()
  {
    fill(255,0,0,50);
    ellipse(x,y,size,size);
  }
  void move()
  {
    deltaX = (mouseX - predator.x) * easing;
    deltaY = (mouseY - predator.y) * easing;
    x += deltaX;
    y += deltaY;
  }
}

class Missile
{
  float slowDown;
  float angleX;
  float angleY;
  float x;
  float y;

  Missile(float initialX, float initialY, float targetX, float targetY)
  {
    slowDown = .04;
    x = initialX;
    y = initialY;
    angleX = (targetX - initialX) * slowDown;
    angleY = (targetY - initialY) * slowDown;
  }

  void collision()
  {
    if(hitRecovery2 < (second() + minute()*60) && color(get(int(x),int(y))) != -16777216 && color(get(int(x),int(y))) != -1 && color(get(int(x),int(y))) != -131587)
    {
      if(color(get(int(x),int(y))) > -20000 && color(get(int(x),int(y))) < 18000 && color(get(int(x),int(y))) < -8000)
      {
        lives--;
        hitRecovery2 = (second() + minute()*60) + 3;
        flash = true;
      }
    }
    if((second() + minute()*60) >= hitRecovery2)
    {
      flash = false;
    }
  }
  void show()
  {
    noStroke();
    fill(0);
    ellipse(x,y,3,3);
  }
  void move()
  {
    x += angleX;
    y += angleY;
  }
}
