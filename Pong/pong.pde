//Gregory Guterman, Comp Prog 4/5, Assignment 18: Pong... with missiles

Puck puck1;
Paddle paddle1;
compPaddle paddle2;
Missile[] missile1 = new Missile[1000000];
compMissile[] missile2 = new compMissile[1000000];
int missileamount = 0;
int compmissileamount = 0;
PFont font;

void setup()
{
  size(300,300);
  frameRate(30);
  fill(255);
  background(0);
  puck1 = new Puck();
  paddle1 = new Paddle();
  paddle2 = new compPaddle();
  font = loadFont("TimesNewRomanPSMT-24.vlw");
  textFont(font);
}

void draw()
{
  fill(0);
  rect(5,5,290,290);
  strokeWeight(7);
  noFill();
  stroke(0,255,0);
  rect(0,0,300,300);
  paddle1.move();
  puck1.show();
  puck1.move();
  puck1.bounce();
  puck1.gameOver();
  paddle1.show();
  paddle1.createMissile();
  paddle2.show();
  paddle2.move();
  paddle2.createMissile();
  for(int i = 0; i < missileamount; i++)
  {
    missile1[i].move();
    missile1[i].show();
    missile1[i].freezePaddle();
  }
  for(int i = 0; i < compmissileamount; i++)
  {
    missile2[i].move();
    missile2[i].show();
    missile2[i].freezePaddle();
  }
}

void mouseClicked()
{
  if(puck1.lose == true || puck1.win == true)
  {
    loop();
    puck1.x = 150;
    puck1.y = 150;
    puck1.speed = 1;
    paddle1.missilesleft = 0;
    paddle2.missilesleft = 0;
    paddle1.hammerTime = false;
    paddle2.hammerTime = false;
    if(mouseX >= 33 && mouseX <= 93 && mouseY >= 225 && mouseY <= 265)
    {
      paddle2.difficulty = 10;
    }
    if(mouseX >= 103 && mouseX <= 198 && mouseY >= 225 && mouseY <=265)
    {
      paddle2.difficulty = 15;
    }
    if(mouseX >= 215 && mouseX <= 275 && mouseY >= 225 && mouseY <=265)
    {
      paddle2.difficulty = 20;
    }
    puck1.lose = false;
    puck1.win = false;
  }
}
public class Puck
{
  public float x;
  public  float y;
  float speed;
  float fakey;
  float xang;
  float yang;
  boolean right;
  boolean down;
  color clr;
  boolean lose;
  boolean win;
  int losses;
  int wins;

  void move()
  {
    if(right == true)
    {
      x = x + xang*speed*2;
    }
    if(down == true)
    {
      y = y + yang*speed*2;
    }
    if(down == false)
    {
      y = y - yang*speed*2;
    }
    if(right == false)
    {
      x = x - xang*speed*2;
    }
    if(y >= 300)
    {
      lose = true;
    }
    if(y <= 0)
    {
      win = true;
    }
  }
  void gameOver()
  {
    if(lose == true)
    {
      noLoop();
      losses++;
      background(0);
      text("You Lose, click to play again",10,50);
      text("Computer: " + losses + " You: " + wins,55,100);
      text("Change difficulty to: ", 40,200);
      if(paddle2.difficulty == 10)
      {
        noStroke();
        fill(255,0,0);
        rect(33,225,60,40);
        fill(puck1.clr);
        rect(103,225,95,40);
        rect(215,225,60,40);
        fill(0);
        text("Easy    Medium     Hard" ,40,250);
      }
      else if(paddle2.difficulty == 15)
      {
        noStroke();
        rect(33,225,60,40);
        fill(255,0,0);
        rect(103,225,95,40);
        fill(puck1.clr);
        rect(215,225,60,40);
        fill(0);
        text("Easy    Medium     Hard" ,40,250);
      }
      else
      {
        noStroke();
        rect(33,225,60,40);
        rect(103,225,95,40);
        fill(255,0,0);
        rect(215,225,60,40);
        fill(0);
        text("Easy    Medium     Hard" ,40,250);
      }
    }
    if(win == true)
    {
      noLoop();
      wins++;
      background(0);
      text("You Win, click to play again",10,50);
      text("Computer: " + losses + " You: " + wins,55,100);
      text("Change difficulty to: ", 40,200);
      if(paddle2.difficulty == 10)
      {
        noStroke();
        fill(255,0,0);
        rect(33,225,60,40);
        fill(puck1.clr);
        rect(103,225,95,40);
        rect(215,225,60,40);
        fill(0);
        text("Easy    Medium     Hard" ,40,250);
      }
      else if(paddle2.difficulty == 15)
      {
        noStroke();
        rect(33,225,60,40);
        fill(255,0,0);
        rect(103,225,95,40);
        fill(puck1.clr);
        rect(215,225,60,40);
        fill(0);
        text("Easy    Medium     Hard" ,40,250);
      }
      else
      {
        noStroke();
        rect(33,225,60,40);
        rect(103,225,95,40);
        fill(255,0,0);
        rect(215,225,60,40);
        fill(0);
        text("Easy    Medium     Hard" ,40,250);
      }

    }
  }

  void show()
  {
    noStroke();
    fill(clr);
    ellipse(x,y,10,10);
  }
  void bounce()
  {
    speed = constrain(speed,1,20);
    fakey = y + 5;
    if(x > 285)
    {
      clr = color(int(random(255)),int(random(255)),int(random(255)));
      right = false;
    }
    if(x < 15)
    {
      clr = color(int(random(255)),int(random(255)),int(random(255)));
      right = true;
    }
    //human bounce
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 10 && x >= paddle1.padx )
    {
      yang = 1;
      xang = 5;
      speed += .50;
      right = false;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 20 && x > paddle1.padx + 10 )
    {
      yang = 2;
      xang = 4;
      speed += .25;
      right = false;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 30 && x > paddle1.padx + 20 )
    {
      yang = 3;
      xang = 3;
      right = false;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 40 && x > paddle1.padx + 30 )
    {
      yang = 4;
      xang = 2;
      speed -= .10;
      right = false;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 50 && x > paddle1.padx + 40)
    {
      yang = 5;
      xang = 1;
      speed -= .25;
      right = false;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 60 && x > paddle1.padx + 50 )
    {
      yang = 5;
      xang = 1;
      speed -= .25;
      right = true;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 70 && x > paddle1.padx + 60 )
    {
      yang = 4;
      xang = 2;
      speed -= .10;
      right = true;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 80 && x > paddle1.padx + 70 )
    {
      yang = 3;
      xang = 3;
      right = true;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 90 && x > paddle1.padx + 80 )
    {
      yang = 2;
      xang = 4;
      speed += .25;
      right = true;
      down = false;
      paddle1.missilesleft++;
    }
    if(x >= paddle1.padx && x <= paddle1.padx + 100 && fakey >= 280 && fakey <= 295 && x <= paddle1.padx + 100 && x > paddle1.padx + 90 )
    {
      yang = 2;
      xang = 4;
      speed += .50;
      right = true;
      down = false;
      paddle1.missilesleft++;
    }
    //computer bounce
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 10 && x >= paddle2.padx)
    {
      yang = 1;
      xang = 5;
      speed += .50;
      right = false;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 20 && x > paddle2.padx + 10)
    {
      yang = 2;
      xang = 4;
      speed += .25;
      right = false;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 30 && x > paddle2.padx + 20)
    {
      yang = 3;
      xang = 3;
      right = false;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 40 && x > paddle2.padx + 30)
    {
      yang = 4;
      xang = 2;
      speed -= .10;
      right = false;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 50 && x > paddle2.padx + 40)
    {
      yang = 5;
      xang = 1;
      speed -= .25;
      right = false;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 60 && x > paddle2.padx + 50)
    {
      yang = 5;
      xang = 1;
      speed -= .25;
      right = true;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 70 && x > paddle2.padx + 60)
    {
      yang = 4;
      xang = 2;
      speed -= .10;
      right = true;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 80 && x > paddle2.padx + 70)
    {
      yang = 3;
      xang = 3;
      right = true;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 90 && x > paddle2.padx + 80)
    {
      yang = 2;
      xang = 4;
      speed += .25;
      right = true;
      down = true;
      paddle2.missilesleft++;
    }
    if(x >= paddle2.padx && x <= paddle2.padx + 100 && y - 5 >= 10 && y - 5 <= 25 && x <= paddle2.padx + 100 && x > paddle2.padx + 90)
    {
      yang = 1;
      xang = 5;
      speed += .50;
      right = true;
      down = true;
      paddle2.missilesleft++;
    }
  }
  Puck()
  {
    lose = false;
    win = false;
    right = true;
    down = true;
    speed = 1;
    x = 170;
    y = 20;
    xang = 3;
    yang = 3;
    clr = color(255,255,255);
  }
}

class Paddle
{
  boolean hammerTime;
  int stopTime;
  public int padx;
  public int pady;
  int a;
  int missilesleft = 0;
  int missiledelay;

  void move()
  {
    if(hammerTime == true)
    {
      stopTime--;
      background(int(random(255)),int(random(255)),int(random(255)));
      stroke(0);
      text("STOP... HAMMERTIME!", 20,150);
    }
    else
    {
      fill(0);
      rect(0,0,299,299);
      strokeWeight(3);
      noFill();
      stroke(0,255,0);
      rect(0,0,300,300);
      padx = mouseX - 50;
    }
    if(stopTime < 1)
    {
      stopTime = 0;
      hammerTime = false;
    }
  }
  void show()
  {
    padx = constrain(padx,5,195);
    fill(255,0,0);
    rect(padx,280,100,15);
  }
  void createMissile()
  {
    if(mousePressed == true && paddle1.missilesleft > 0 && missiledelay == 0)
    {
      missile1[missileamount++] = new Missile();
      missilesleft--;
      missiledelay = 3;
    }
    else if(mousePressed == true && missiledelay != 0)
    {
      missiledelay--;
    }
  }
  Paddle()
  {
    missilesleft = 0;
    missiledelay = 0;
  }
}

class compPaddle extends Paddle
{
  int difficulty;
  void move()
  {
    if(hammerTime == true)
    {
      stopTime--;
    }
    else if(puck1.x >= padx + 50 && puck1.right == true)
    {
      padx = padx + difficulty;
    }
    else if(puck1.x < padx + 50 && puck1.right == false)
    {
      padx = padx - difficulty;
    }
    if(stopTime < 1)
    {
      stopTime = 0;
      hammerTime = false;
    }
  }
  void show()
  {
    padx = constrain(padx,5,195);
    fill(255,0,0);
    rect(padx,10,100,15);
  }
  void createMissile()
  {
    if(puck1.y > 130 && puck1.y < 170 && missilesleft > 0 && missiledelay == 0 && difficulty != 20)
    {
      missile2[compmissileamount++] = new compMissile();
      missilesleft--;
      missiledelay = 15;
    }
    else if(puck1.y > 130 && puck1.y < 170 && missiledelay != 0)
    {
      missiledelay--;
    }
    if(missilesleft >= 3 && difficulty == 20 && puck1.y > 130 && puck1.y < 170)
    {
      paddle2.padx = int(random(0,66));
      missile2[compmissileamount++] = new compMissile();
      missilesleft--;
      paddle2.padx = int(random(66,133));
      missile2[compmissileamount++] = new compMissile();
      missilesleft--;
      paddle2.padx = int(random(133,266));
      missile2[compmissileamount++] = new compMissile();
      missilesleft--;
    }
    if(missilesleft >= 3 && difficulty == 15 && puck1.y > 130 && puck1.y < 170)
    {
      paddle2.padx = int(random(0,255));
      missile2[compmissileamount++] = new compMissile();
      missilesleft--;
      paddle2.padx = int(random(0,255));
      missile2[compmissileamount++] = new compMissile();
      missilesleft--;
      paddle2.padx = int(random(0,255));
      missile2[compmissileamount++] = new compMissile();
      missilesleft--;
    }
  }
  compPaddle()
  {
    hammerTime = false;
    difficulty = 15;
    missilesleft = 0;
    missiledelay = 0;
  }
}

class Missile
{
  int x;
  int y;
  int mislExploRate;

  void show()
  {
    noStroke();
    fill(255,255,0);
    rect(x + 50,y,3,10);
  }
  void move()
  {
    y = y - 5;
  }
  void freezePaddle()
  {
    if(x + 51 >= paddle2.padx && x + 51 <= paddle2.padx + 100 && y >= 10 && y <= 25 && int(random(mislExploRate)) == 5)
    {
      paddle2.stopTime = 50;
      paddle2.hammerTime = true;
    }
  }

  Missile()
  {
    if(paddle2.difficulty == 10)
    {
      mislExploRate = 10;
      x = paddle1.padx;
      y = 280;
    }
    else if(paddle2.difficulty == 15)
    {
      mislExploRate = 50;
      x = paddle1.padx;
      y = 280;
    }
    else
    {
      mislExploRate = 100;
      x = paddle1.padx;
      y = 280;
    }
  }
}

class compMissile extends Missile
{
  int speed;
  void move()
  {
    y = y + speed;
  }
  compMissile()
  {
    if(paddle2.difficulty == 20)
    {
      speed = 10;
    }
    else
    {
      speed = 5;
    }
    x = paddle2.padx;
    y = 25;
  }
  void freezePaddle()
  {
    if(x + 51 >= paddle1.padx && x + 51<= paddle1.padx + 100 && y >= 280 && y <= 295)
    {
      paddle1.stopTime = 50;
      paddle1.hammerTime = true;
    }
  }
}

