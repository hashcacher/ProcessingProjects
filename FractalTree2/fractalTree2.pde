//Gregory Guterman, Comp Prog 2, 4/5, Assignment 12: Fractal Tree
import ddf.minim.*;

int r,g,b,i;
float fractionLength = .7;
int smallestBranch = 10;
float branchAngle = .7;
float branchDensity = .3;
int branchLength = 100;
boolean crazy = false;
boolean bird = false;
boolean reload = false;
int y = 380;
boolean[] reloadBuffer = new boolean[100];
Bird birdie;
Minim minim;
AudioPlayer player;
PFont font;
int textTime;
int opacity;

void setup()
{
  font = loadFont("Algerian-48.vlw");
  textFont(font,48);
  for(int j = 0; j < 100; j++)
  {
    reloadBuffer[j] = false;
  }
  r = 255;
  g = 0;
  b = 255;
  i = width - 100;
  minim = new Minim(this);
  player = minim.loadFile("shotgun.wav", 2048);
  size(630,480);
  noLoop();
  frameRate(20);
}

void draw()
{
  background(0);
  if(crazy == true)
  {
    crazyMode();
  }
  else
  {
    stroke(0,255,0);
    line(320,480,320,380);
  }
  if(bird == true)
  {
    birdMode();
  }
  stroke(0,255,0);
  strokeWeight(1);
  drawBranches(320,y,branchLength,3*PI/2);
  if(textTime > 0)
  {
    fill(255,255,255,opacity);
    text("Hit", width/3, height/2);
    textTime--;
    opacity-=3;
  }
}

void mouseReleased()
{
  if(bird == true && reload == false)
  {
    player.rewind();
    player.play();
    reload = true;
    if(mouseX > birdie.x && mouseX < birdie.x + 54 && mouseY > birdie.y && mouseY < birdie.y + 42)
    {
      birdie.hit();
    }
  }
}

void keyPressed()
{
  if(key == 'a' && branchDensity > .25)
  {
    branchDensity -= .1;
    redraw();
  }
  else if(key == 'd' && branchDensity < .8)
  {
    branchDensity += .1;
    redraw();
  }
  else if(key == 's' && branchLength > 30)
  {
    branchLength -= 5;
    redraw();
  }
  else if(key == 'w' && branchLength < 120)
  {
    branchLength += 5;
    redraw();
  }
  else if(key == 'e' && branchAngle < .9)
  {
    branchAngle += .1;
    redraw();
  }
  else if(key == 'q' && branchAngle > .3)
  {
    branchAngle -= .1;
    redraw();
  }
  else if(key == ENTER && crazy == false)
  {
    crazy = true;
    y = 250;
    loop();
  }
  else if(key == ENTER && crazy == true)
  {
    background(0);
    crazy = false;
    y = 380;
    branchAngle = .7;
    noLoop();
    line(320,480,320,380);
    drawBranches(320,y,branchLength,3*PI/2);
  }
  else if(key == BACKSPACE && bird == false)
  {
    birdie = new Bird();
    bird = true;
    loop();
  }
  else if(key == BACKSPACE && bird == true)
  {
    bird = false;
    noLoop();
    redraw();
  }

}

void crazyMode()
{
  branchAngle += .05;
}

void birdMode()
{
  birdie.show();
  birdie.move();
  noFill();
  stroke(255,0,0);
  strokeWeight(3);
  ellipse(mouseX,mouseY,20,20);//crosshair
  line(mouseX - 15, mouseY, mouseX + 15, mouseY);
  line(mouseX, mouseY - 15, mouseX, mouseY + 15);
  stroke(255,255,0);//reload
  rect(width - 115, 0,110, 20);
  if(reload == true)
  {
    if(i < 100)
    {
      reloadBuffer[i] = true;
      reloadBuffer[i+1] = true;
      i+=2;
    }
    for(int j = 0; j < 100; j+=20)
    {
      if(reloadBuffer[j] == true)
      {
        stroke(r,g,b);
        fill(r,g,b);
        rect(j + 520,5,20,10);
        r--;
        g++;
        b--;
      }
    }
    if(r == 110)
    {
      reload = false;
      i = 0;
      r = 255;
      g = 0;
      b = 255;
      for(int k = 0; k < 100; k++)
      {
        reloadBuffer[k] = false;
      }
    }
  }
}

void drawBranches(int x,int y, float branchLength, float angle)
{
  int endX1, endY1, endX2, endY2, endX3, endY3, endX4, endY4;
  float branchLength2 = branchLength;
  float angle1 = angle + branchAngle;
  float angle2 = angle + branchAngle / 2;
  float angle3 = angle - branchAngle;
  float angle4 = angle - branchAngle / 2;
  branchLength2 = branchLength * fractionLength;
  endX1 = int((branchLength*cos(angle1) + x));
  endY1 = int((branchLength*sin(angle1) + y));
  endX2 = int((branchLength*cos(angle2)) + x);
  endY2 = int((branchLength*sin(angle2) + y));
  endX3 = int((branchLength*cos(angle3)) + x);
  endY3 = int((branchLength*sin(angle3) + y));
  endX4 = int((branchLength*cos(angle4)) + x);
  endY4 = int((branchLength*sin(angle4) + y));
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  line(x,y,endX3,endY3);
  line(x,y,endX4,endY4);
  if(branchLength * branchDensity  > smallestBranch)
  {
    drawBranches(endX1,endY1,branchLength2,angle1);
    drawBranches(endX2,endY2,branchLength2,angle2);
    drawBranches(endX3,endY3,branchLength2,angle3);
    drawBranches(endX4,endY4,branchLength2,angle4);
  }
}

class Bird
{
  int x,y;
  int xSpeed, ySpeed;
  PImage bird;

  Bird()
  {
    bird = loadImage("bird.bmp");
    x = 10;
    y = height/2;
    xSpeed = 20;
    ySpeed = 20;
  }

  void show()
  {
    image(bird,x,y);
  }
  void move()
  {
    x += xSpeed;
    if(y < height - 50 && y > 0)
    {
      y += int(random(-ySpeed, ySpeed));
    }
    else if(y >= height - 50)
    {
      y += int(random(-ySpeed, 0));
      println("too low");
    }
    else if(y <= 0)
    {
      y += int(random(0, ySpeed));
      println("too high");
    }
    if(x > width || x < -50)
    {
      xSpeed = -xSpeed;
    }
  }
  void hit()
  {
    textTime = 200;
    opacity = 255;
    println("ouch");
  }
}













