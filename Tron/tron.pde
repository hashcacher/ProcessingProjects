//Gregory Guterman , Comp Prog 4/5, Assignment 11: Tron
/* Tron
Use WASD to move the red human player
If you crash into a trail, you lose!*/

PFont font;
PFont scorefont;
int x = 120;
int y = 150;
boolean up = false;
boolean down = false;
boolean left = true;
boolean right = false;
boolean begin = false;
int x1 = 180;
int y1 = 150;
boolean up1 = false;
boolean down1 = false;
boolean left1 = false;
boolean right1 = true;
boolean win = false;
boolean lose = false;
int rand = 0;
boolean up2 = true;
boolean down2 = false;
boolean left2 = false;
boolean right2 = false;
int x2 = 150;
int y2 = 120;
int rand2 = 0;
boolean up3 = false;
boolean down3 = true;
boolean left3 = false;
boolean right3 = false;
int x3 = 150;
int y3 = 180;
int rand4 = 0;
boolean checkcomp1dead = false;
boolean checkcomp2dead = false;
boolean checkcomp3dead = false;
int humanscore = 0;
int compscore = 0;
boolean switch1 = false;
int a = 10;

void setup()
{
  scorefont = loadFont("TimesNewRomanPSMT-12.vlw");
  font = loadFont("Mistral-36.vlw");
  frameRate(30);
  size(300,300);
  background(150,150,100);
  noStroke();
  fill(0);
  rect(10,10,280,280);
  key = 'a';
  left = true;
  right1 = true;
}

void draw()
{
  a = int(random(1,10));
  score();
  randomturn();
  randomturn1();
  randomturn2();
  beginit();
  human();
  movehuman();
  checkhuman();
  computer();
  checkcomputer();
  point(x1,y1);
  computer1();
  checkcomputer1();
  point(x2,y2);
  computer2();
  checkcomputer2();
  point(x3,y3);
  checkcomps();
}

void randomturn()
{
  int rand = int(random(0,150));
  if(rand == 2)
  {
    if(up1 == true)
    {
      if(get(x1-1,y1) != color(0,0,0) && left1 != true)
      {
        right1 = true;
        x1++;
        up1 = false;
      }
      else if(get(x1+1,y1) != color(0,0,0) && right1 != true)
      {
        left1 = true;
        x1--;
        up1 = false;
      }
      else
      {
        for(int i = x1; i < 290; i++)
        {
          if(get(x1 + i,y1) != color(0,0,0))
          {
            left1 = true;
            up1 = false;
            break;
          }
          if(get(x1 - i,y1) != color(0,0,0))
          {
            right1 = true;
            up1 = false;
            break;
          }
        }
      }
    }

    else if(down1 == true)
    {
      if(get(x1-1,y1) != color(0,0,0) && left1 != true)
      {
        right1 = true;
        x1++;
        down1 = false;
      }
      else if(get(x1+1,y1) != color(0,0,0) && right1 != true)
      {
        left1 = true;
        x1--;
        down1 = false;
      }
      else
      {
        for(int i = x1; i < 290; i++)
        {
          if(get(x1 + i,y1) != color(0,0,0))
          {
            left1 = true;
            down1 = false;
            break;
          }
          if(get(x1 - i,y1) != color(0,0,0))
          {
            right1 = true;
            down1 = false;
            break;
          }
        }
      }
    }

    else if(left1 == true)
    {
      if(get(x1,y1-1) != color(0,0,0) && up1 != true)
      {
        down1 = true;
        y1++;
        left1 = false;
      }
      else if(get(x1,y1+1) != color(0,0,0) && down1 != true)
      {
        up1 = true;
        y1--;
        left1 = false;
      }
      else
      {
        for(int i = y1; i < 290; i++)
        {
          if(get(x1,y1 + i) != color(0,0,0))
          {
            up1 = true;
            left1 = false;
            break;
          }
          if(get(x1,y1 - i) != color(0,0,0))
          {
            down1 = true;
            left1 = false;
            break;
          }
        }
      }
    }

    else if(right1 == true)
    {
      if(get(x1,y1+1) != color(0,0,0) && down1 != true)
      {
        up1 = true;
        y1--;
        right1 = false;
      }
      else if(get(x1,y1-1) != color(0,0,0) && up1 != true)
      {
        down1 = true;
        y1++;
        right1 = false;
      }
      else
      {
        for(int i = y1; i < 290; i++)
        {
          if(get(x1,y1 + i) != color(0,0,0))
          {
            up1 = true;
            right1 = false;
            break;
          }
          if(get(x1,y1 - i) != color(0,0,0))
          {
            down1 = true;
            right1 = false;
            break;
          }
        }
      }
    }
  }
}

void randomturn1()
{
  int rand2 = int(random(0,100));
  if(rand2 == 2)
  {
    if(up2 == true)
    {
      if(get(x2-1,y2) != color(0,0,0) && left2 != true)
      {
        right2 = true;
        x2++;
        up2 = false;
      }
      else if(get(x2+1,y2) != color(0,0,0) && right2 != true)
      {
        left2 = true;
        x2--;
        up2 = false;
      }
      else if(x2 <= 150  && y2 <= 150)
      {
        right2 = true;
        x2++;
        up2 = false;
      }
      else if(x2 > 150 && y2 < 150)
      {
        left2 = true;
        x2--;
        up2 = false;
      }
      else if(x2 < 150 && y2 > 150)
      {
        right2 = true;
        x2++;
        up2 = false;
      }
      else if(x2 > 150 && y2 > 150)
      {
        left2 = true;
        x2--;
        up2 = false;
      }
      else
      {
        left2 = true;
        x2--;
        up2 = false;
      }
    }


    else if(down2 == true)
    {
      if(get(x2-1,y2) != color(0,0,0) && left2 != true)
      {
        right2 = true;
        x2++;
        down2 = false;
      }
      else if(get(x2+1,y2) != color(0,0,0) && right2 != true)
      {
        left2 = true;
        x2--;
        down2 = false;
      }
      else if(x2 <= 150 && y2 <= 150)
      {
        right2 = true;
        x2++;
        down2 = false;
      }
      else if(x2 > 150 && y2 < 150)
      {
        left2 = true;
        x2--;
        down2 = false;
      }
      else if(x2 < 150 && y2 > 150)
      {
        right2 = true;
        x2++;
        down2 = false;
      }
      else
      {
        left2 = true;
        x2--;
        down2 = false;
      }
    }

    else if(left2 == true)
    {
      if(get(x2,y2-1) != color(0,0,0) && up2 != true)
      {
        down2 = true;
        y2++;
        left2 = false;
      }
      else if(get(x2,y2+1) != color(0,0,0) && down2 != true)
      {
        up2 = true;
        y2--;
        left2 = false;
      }
      else if(x2 <= 150 && y2 <= 150)
      {
        down2 = true;
        y2++;
        left2 = false;
      }
      else if(x2 >= 150 && y2 <= 150)
      {
        down2 = true;
        y2++;
        left2 = false;
      }
      else if(x2 <= 150 && y2 >= 150)
      {
        up2 = true;
        y2--;
        left2 = false;
      }
      else
      {
        up2 = true;
        y2--;
        left2 = false;
      }
    }

    else if(right2 == true)
    {
      if(get(x2,y2+1) != color(0,0,0) && down2 != true)
      {
        up2 = true;
        y2--;
        right2 = false;
      }
      else if(get(x2,y2-1) != color(0,0,0) && up2 != true)
      {
        down2 = true;
        y2++;
        right2 = false;
      }
      else if(x2 <= 150 && y2 <= 150)
      {
        down2 = true;
        y2++;
        right2 = false;
      }
      else if(x2 > 150 && y2 < 150)
      {
        down2 = true;
        y2++;
        right2 = false;
      }
      else if(x2 < 150 && y2 > 150)
      {
        up2 = true;
        y2--;
        right2 = false;
      }
      else
      {
        up2 = true;
        y2--;
        right2 = false;
      }
    }
  }
}

void beginit()
{
  if(begin == true)
  {
    checkcomp1dead = false;
    checkcomp2dead = false;
    checkcomp3dead = false;
    key = '0';
    up1 = false;
    down1 = false;
    left1 = false;
    right1 = false;
    up = false;
    down = false;
    left = false;
    right = false;
    up2 = false;
    down2 = false;
    left2 = false;
    right2 = false;
    up3 = false;
    down3 = false;
    left3 = false;
    right3 = false;
    if(switch1 == false && win == true)
    {
      humanscore++;
      switch1 = true;
    }
    if(switch1 == false && lose == true)
    {
      compscore++;
      switch1 = true;
    }
    if(mousePressed == true)
    {
      switch1 = false;
      lose = false;
      win = false;
      background(150,150,100);
      noStroke();
      fill(0);
      rect(10,10,280,280);
      key = 'a';
      x = 120;
      y = 150;
      x1 = 180;
      y1 = 150;
      x2 = 150;
      y2 = 120;
      x3 = 150;
      y3 = 180;
      up3 = false;
      down3 = true;
      left3 = false;
      right3 = true;
      up1 = false;
      down1 = false;
      left1 = false;
      right1 = true;
      up = false;
      down = false;
      left = true;
      right = false;
      up2 = true;
      down2 = false;
      left2 = false;
      right2 = false;
      begin = false;
    }
  }
}

void movehuman()
{
  if(up == true)
  {
    y--;
  }
  if(down == true)
  {
    y++;
  }
  if(left == true)
  {
    x--;
  }
  if(right == true)
  {
    x++;
  }
}


void human()
{
  if(up == true && key != 'a' && key != 'd')
  {
    up = true;
    key = 'w';
  }
  if(down == true && key != 'a' && key != 'd')
  {
    down = true;
    key = 's';
  }
  if(right == true && key != 'w' && key != 's')
  {
    right = true;
    key = 'd';
  }
  if(left == true && key != 'w' && key != 's')
  {
    left = true;
    key = 'a';
  }
  if(key == 'w')
  {
    up = true;
  }
  else
  {
    up = false;
  }
  if(key == 'a')
  {
    left = true;
  }
  else
  {
    left = false;
  }
  if(key == 's')
  {
    down = true;
  }
  else
  {
    down = false;
  }
  if(key == 'd')
  {
    right = true;
  }
  else
  {
    right = false;
  }
}

void checkhuman()
{
  if(get(x,y) != color(0,0,0) && win == false)
  {
    textFont(font);
    lose = true;
    fill(255);
    text("You lose",100,150);
    begin = true;
  }
  stroke(255,0,0);
  point(x,y);
}

void computer()
{
  if(up1 == true)
  {
    if(get(x1,y1-1) != color(0,0,0) || get(x1,y1-a) != color(0,0,0))
    {
      if(get(x1-1,y1) != color(0,0,0) && left1 != true)
      {
        right1 = true;
        x1++;
        up1 = false;
      }
      else if(get(x1+1,y1) != color(0,0,0) && right1 != true)
      {
        left1 = true;
        x1--;
        up1 = false;
      }
      else
      {
        for(int i = x1; i < 290; i++)
        {
          if(get(x1 + i,y1) != color(0,0,0))
          {
            left1 = true;
            x1--;
            up1 = false;
            break;
          }
          if(get(x1 - i,y1) != color(0,0,0))
          {
            right1 = true;
            x1++;
            up1 = false;
            break;
          }
        }
      }
    }
    else
    {
      y1--;
    }
  }

  else if(down1 == true)
  {
    if(get(x1,y1+1) != color(0,0,0) || get(x1,y1+a) != color(0,0,0))
    {
      if(get(x1-1,y1) != color(0,0,0) && left1 != true)
      {
        right1 = true;
        x1++;
        down1 = false;
      }
      else if(get(x1+1,y1) != color(0,0,0) && right1 != true)
      {
        left1 = true;
        x1--;
        down1 = false;
      }
      else
      {
        for(int i = x1; i < 290; i++)
        {
          if(get(x1 + i,y1) != color(0,0,0))
          {
            left1 = true;
            x1--;
            down1 = false;
            break;
          }
          if(get(x1 - i,y1) != color(0,0,0))
          {
            right1 = true;
            x1++;
            down1 = false;
            break;
          }
        }
      }
    }
    else
    {
      y1++;
    }
  }
  else if(left1 == true)
  {
    if(get(x1-1,y1) != color(0,0,0) || get(x1-a,y1) != color(0,0,0))
    {
      if(get(x1,y1-1) != color(0,0,0) && up1 != true)
      {
        down1 = true;
        y1++;
        left1 = false;
      }
      else if(get(x1,y1+1) != color(0,0,0) && down1 != true)
      {
        up1 = true;
        y1--;
        left1 = false;
      }
      else
      {
        for(int i = y1; i < 290; i++)
        {
          if(get(x1,y1 + i) != color(0,0,0))
          {
            up1 = true;
            y1--;
            left1 = false;
            break;
          }
          if(get(x1,y1 - i) != color(0,0,0))
          {
            down1 = true;
            y1++;
            left1 = false;
            break;
          }
        }
      }
    }
    else
    {
      x1--;
    }
  }
  else if(right1 == true)
  {
    if(get(x1+1,y1) != color(0,0,0) || get(x1+a,y1) != color(0,0,0))
    {
      if(get(x1,y1+1) != color(0,0,0) && down1 != true)
      {
        up1 = true;
        y1--;
        right1 = false;
      }
      else if(get(x1,y1-1) != color(0,0,0) && up1 != true)
      {
        down1 = true;
        y1++;
        right1 = false;
      }
      else
      {
        for(int i = y1; i < 290; i++)
        {
          if(get(x1,y1 + i) != color(0,0,0))
          {
            up1 = true;
            y1--;
            right1 = false;
            break;
          }
          if(get(x1,y1 - i) != color(0,0,0))
          {
            down1 = true;
            y1++;
            right1 = false;
            break;
          }
        }
      }
    }
    else
    {
      x1++;
    }
  }
}




void checkcomputer()
{
  if(get(x1,y1) != color(0,0,0) && lose == false)
  {
    checkcomp1dead = true;
    fill(255);
    left1 = false;
    right1 = false;
    up1 = false;
    down1 = false;
  }
  stroke(255,255,0);
}

void computer1()
{
  if(up2 == true)
  {
    if(get(x2,y2-1) != color(0,0,0) || get(x2,y2-a) != color(0,0,0))
    {
      if(get(x2-1,y2) != color(0,0,0) && left2 != true)
      {
        right2 = true;
        x2++;
        up2 = false;
      }
      else if(get(x2+1,y2) != color(0,0,0) && right2 != true)
      {
        left2 = true;
        x2--;
        up2 = false;
      }
      else if(x2 <= 150  && y2 <= 150)
      {
        right2 = true;
        x2++;
        up2 = false;
      }
      else if(x2 > 150 && y2 < 150)
      {
        left2 = true;
        x2--;
        up2 = false;
      }
      else if(x2 < 150 && y2 > 150)
      {
        right2 = true;
        x2++;
        up2 = false;
      }
      else if(x2 > 150 && y2 > 150)
      {
        left2 = true;
        x2--;
        up2 = false;
      }
    }
    else
    {
      y2--;
    }
  }

  else if(down2 == true)
  {
    if(get(x2,y2+1) != color(0,0,0) || get(x2,y2+a) != color(0,0,0))
    {
      if(get(x2-1,y2) != color(0,0,0) && left2 != true)
      {
        right2 = true;
        x2++;
        down2 = false;
      }
      else if(get(x2+1,y2) != color(0,0,0) && right2 != true)
      {
        left2 = true;
        x2--;
        down2 = false;
      }
      else if(x2 <= 150 && y2 <= 150)
      {
        right2 = true;
        x2++;
        down2 = false;
      }
      else if(x2 > 150 && y2 < 150)
      {
        left2 = true;
        x2--;
        down2 = false;
      }
      else if(x2 < 150 && y2 > 150)
      {
        right2 = true;
        x2++;
        down2 = false;
      }
      else
      {
        left2 = true;
        x2--;
        down2 = false;
      }
    }
    else
    {
      y2++;
    }
  }
  else if(left2 == true)
  {
    if(get(x2-1,y2) != color(0,0,0) || get(x2-a,y2) != color(0,0,0))
    {
      if(get(x2,y2-1) != color(0,0,0) && up2 != true)
      {
        down2 = true;
        y2++;
        left2 = false;
      }
      else if(get(x2,y2+1) != color(0,0,0) && down2 != true)
      {
        up2 = true;
        y2--;
        left2 = false;
      }
      else if(x2 <= 150 && y2 <= 150)
      {
        down2 = true;
        y2++;
        left2 = false;
      }
      else if(x2 >= 150 && y2 <= 150)
      {
        down2 = true;
        y2++;
        left2 = false;
      }
      else if(x2 <= 150 && y2 >= 150)
      {
        up2 = true;
        y2--;
        left2 = false;
      }
      else
      {
        up2 = true;
        y2--;
        left2 = false;
      }
    }
    else
    {
      x2--;
    }
  }
  else if(right2 == true)
  {
    if(get(x2+1,y2) != color(0,0,0) || get(x2+a,y2) != color(0,0,0))
    {
      if(get(x2,y2+1) != color(0,0,0) && down2 != true)
      {
        up2 = true;
        y2--;
        right2 = false;
      }
      else if(get(x2,y2-1) != color(0,0,0) && up2 != true)
      {
        down2 = true;
        y2++;
        right2 = false;
      }
      else if(x2 <= 150 && y2 <= 150)
      {
        down2 = true;
        y2++;
        right2 = false;
      }
      else if(x2 > 150 && y2 < 150)
      {
        down2 = true;
        y2++;
        right2 = false;
      }
      else if(x2 < 150 && y2 > 150)
      {
        up2 = true;
        y2--;
        right2 = false;
      }
      else
      {
        up2 = true;
        y2--;
        right2 = false;
      }
    }
    else
    {
      x2++;
    }
  }
}

void checkcomputer1()
{
  if(get(x2,y2) != color(0,0,0) && lose == false)
  {
    checkcomp2dead = true;
    fill(255);
    left2 = false;
    right2 = false;
    up2 = false;
    down2 = false;
  }
  stroke(255,20,147);
}

void randomturn2()
{
  int rand4 = int(random(0,70));
  if(rand4 == 2)
  {
    if(up3 == true)
    {
      if(get(x3-1,y3) != color(0,0,0) && left3 != true)
      {
        right3 = true;
        x3++;
        up3 = false;
      }
      else if(get(x3+1,y3) != color(0,0,0) && right3 != true)
      {
        left3 = true;
        x3--;
        up3 = false;
      }
      else if(x3 <= 150  && y3 <= 150)
      {
        right3 = true;
        x3++;
        up3 = false;
      }
      else if(x3 > 150 && y3 < 150)
      {
        left3 = true;
        x3--;
        up3 = false;
      }
      else if(x3 < 150 && y3 > 150)
      {
        right3 = true;
        x3++;
        up3 = false;
      }
      else if(x3 > 150 && y3 > 150)
      {
        left3 = true;
        x3--;
        up3 = false;
      }
      else
      {
        left3 = true;
        x3--;
        up3 = false;
      }
    }


    else if(down3 == true)
    {
      if(get(x3-1,y3) != color(0,0,0) && left3 != true)
      {
        right3 = true;
        x3++;
        down3 = false;
      }
      else if(get(x3+1,y3) != color(0,0,0) && right3 != true)
      {
        left3 = true;
        x3--;
        down3 = false;
      }
      else if(x3 <= 150 && y3 <= 150)
      {
        right3 = true;
        x3++;
        down3 = false;
      }
      else if(x3 > 150 && y3 < 150)
      {
        left3 = true;
        x3--;
        down3 = false;
      }
      else if(x3 < 150 && y3 > 150)
      {
        right3 = true;
        x3++;
        down3 = false;
      }
      else
      {
        left3 = true;
        x3--;
        down3 = false;
      }
    }

    else if(left3 == true)
    {
      if(get(x3,y3-1) != color(0,0,0) && up3 != true)
      {
        down3 = true;
        y3++;
        left3 = false;
      }
      else if(get(x3,y3+1) != color(0,0,0) && down3 != true)
      {
        up3 = true;
        y3--;
        left3 = false;
      }
      else if(x3 <= 150 && y3 <= 150)
      {
        down3 = true;
        y3++;
        left3 = false;
      }
      else if(x3 >= 150 && y3 <= 150)
      {
        down3 = true;
        y3++;
        left3 = false;
      }
      else if(x3 <= 150 && y3 >= 150)
      {
        up3 = true;
        y3--;
        left3 = false;
      }
      else
      {
        up3 = true;
        y3--;
        left3 = false;
      }
    }

    else if(right3 == true)
    {
      if(get(x3,y3+1) != color(0,0,0) && down3 != true)
      {
        up3 = true;
        y3--;
        right3 = false;
      }
      else if(get(x3,y3-1) != color(0,0,0) && up3 != true)
      {
        down3 = true;
        y3++;
        right3 = false;
      }
      else if(x3 <= 150 && y3 <= 150)
      {
        down3 = true;
        y3++;
        right3 = false;
      }
      else if(x3 > 150 && y3 < 150)
      {
        down3 = true;
        y3++;
        right3 = false;
      }
      else if(x3 < 150 && y3 > 150)
      {
        up3 = true;
        y3--;
        right3 = false;
      }
      else
      {
        up3 = true;
        y3--;
        right3 = false;
      }
    }
  }
}

void computer2()
{
  if(up3 == true)
  {
    if(get(x3,y3-1) != color(0,0,0) || get(x3,y3-a) != color(0,0,0))
    {
      if(get(x3-1,y3) != color(0,0,0) && left3 != true)
      {
        right3 = true;
        x3++;
        up3 = false;
      }
      else if(get(x3+1,y3) != color(0,0,0) && right3 != true)
      {
        left3 = true;
        x3--;
        up3 = false;
      }
      else if(x3 <= 150  && y3 <= 150)
      {
        right3 = true;
        x3++;
        up3 = false;
      }
      else if(x3 > 150 && y3 < 150)
      {
        left3 = true;
        x3--;
        up3 = false;
      }
      else if(x3 < 150 && y3 > 150)
      {
        right3 = true;
        x3++;
        up3 = false;
      }
      else if(x3 > 150 && y3 > 150)
      {
        left3 = true;
        x3--;
        up3 = false;
      }
    }
    else
    {
      y3--;
    }
  }

  else if(down3 == true)
  {
    if(get(x3,y3+1) != color(0,0,0) || get(x3,y3+a) != color(0,0,0))
    {
      if(get(x3-1,y3) != color(0,0,0) && left3 != true)
      {
        right3 = true;
        x3++;
        down3 = false;
      }
      else if(get(x3+1,y3) != color(0,0,0) && right3 != true)
      {
        left3 = true;
        x3--;
        down3 = false;
      }
      else if(x3 <= 150 && y3 <= 150)
      {
        right3 = true;
        x3++;
        down3 = false;
      }
      else if(x3 > 150 && y3 < 150)
      {
        left3 = true;
        x3--;
        down3 = false;
      }
      else if(x3 < 150 && y3 > 150)
      {
        right3 = true;
        x3++;
        down3 = false;
      }
      else
      {
        left3 = true;
        x3--;
        down3 = false;
      }
    }
    else
    {
      y3++;
    }
  }
  else if(left3 == true)
  {
    if(get(x3-1,y3) != color(0,0,0) || get(x3-a,y3) != color(0,0,0))
    {
      if(get(x3,y3-1) != color(0,0,0) && up3 != true)
      {
        down3 = true;
        y3++;
        left3 = false;
      }
      else if(get(x3,y3+1) != color(0,0,0) && down3 != true)
      {
        up3 = true;
        y3--;
        left3 = false;
      }
      else if(x3 <= 150 && y3 <= 150)
      {
        down3 = true;
        y3++;
        left3 = false;
      }
      else if(x3 >= 150 && y3 <= 150)
      {
        down3 = true;
        y3++;
        left3 = false;
      }
      else if(x3 <= 150 && y3 >= 150)
      {
        up3 = true;
        y3--;
        left3 = false;
      }
      else
      {
        up3 = true;
        y3--;
        left3 = false;
      }
    }
    else
    {
      x3--;
    }
  }
  else if(right3 == true)
  {
    if(get(x3+1,y3) != color(0,0,0) || get(x3+a,y3) != color(0,0,0))
    {
      if(get(x3,y3+1) != color(0,0,0) && down3 != true)
      {
        up3 = true;
        y3--;
        right3 = false;
      }
      else if(get(x3,y3-1) != color(0,0,0) && up3 != true)
      {
        down3 = true;
        y3++;
        right3 = false;
      }
      else if(x3 <= 150 && y3 <= 150)
      {
        down3 = true;
        y3++;
        right3 = false;
      }
      else if(x3 > 150 && y3 < 150)
      {
        down3 = true;
        y3++;
        right3 = false;
      }
      else if(x3 < 150 && y3 > 150)
      {
        up3 = true;
        y3--;
        right3 = false;
      }
      else
      {
        up3 = true;
        y3--;
        right3 = false;
      }
    }
    else
    {
      x3++;
    }
  }
}

void checkcomputer2()
{
  if(get(x3,y3) != color(0,0,0) && lose == false)
  {
    checkcomp3dead = true;
    fill(255);
    left3 = false;
    right3 = false;
    up3 = false;
    down3 = false;
  }
  stroke(0,191,255);
}

void checkcomps()
{
  if(checkcomp1dead == true && checkcomp2dead == true && checkcomp3dead == true)
  {
    textFont(font);
    text("You Win!", 100, 150);
    win = true;
    begin = true;
  }
}

void score()
{
  noStroke();
  fill(150,150,100);
  rect(10,290,300,10);
  fill(255);
  textFont(scorefont);
  text("Human: " + humanscore + " Computer: " + compscore,100,299);
}

