//Gregory Guterman, Comp Prog 2 4/5, Assignment 3: Skyline
Building [] building1;
OtherBuilding [] building2;
OtherBuilding2[] building3;
OtherBuilding3[] building4;
Star[] star1;
Moon moon1;
int lastX = 0;
int lastZ1;
int lastD1;
int lastW;
float cameraX = width/2.0 + 1000;
float cameraY = height/2.0;
int cameraZ = -900;
float pointCameraX = width/2.0 - 500;
float pointCameraY = height/2.0;
int pointCameraZ = 500;
float a = 0;
float b = 1;
float c = 0;


PImage window;

void setup()
{
  background(0);
  size(500,500,P3D);
  frameRate(20);
  building1 = new Building[10];
  building2 = new OtherBuilding[10];
  building3 = new OtherBuilding2[10];
  building4 = new OtherBuilding3[10];
  star1 = new Star[100];

  for(int i = 0; i < 10; i++)
  {
    building1[i] = new Building();
  }
  for(int i = 0; i < 10; i++)
  {
    building2[i] = new OtherBuilding();
  }
  for(int i = 0; i < 10; i++)
  {
    building3[i] = new OtherBuilding2();
  }
  for(int i = 0; i < 10; i++)
  {
    building4[i] = new OtherBuilding3();
  }
  for(int i = 0; i < 100; i++)
  {
    star1[i] = new Star();
  }
  moon1 = new Moon();
  camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  window = loadImage("window.bmp");
}

void draw()
{
  background(0);
  cameraZ = constrain(cameraZ,-1000,-100);
  cameraX = constrain(cameraX, 300,900);

  if(keyPressed == true && key == 'a')
  {
    cameraX += 100;
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  }
  if(keyPressed == true && key =='d')
  {
    // println("CameraX is " + cameraX);
    cameraX -= 100;
    //background(0);
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  }
  if(keyPressed == true && key =='s')
  {
    // println("CameraZ is " + cameraZ);
    cameraZ -= 100;
    //background(0);
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  }
  if(keyPressed == true && key =='w')
  {
    // println("CameraZ is " + cameraZ);
    cameraZ += 100;
    //background(0);
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  }
  if(keyPressed == true && key =='o')
  {
    // println("CameraY is " + cameraY);
    cameraY -= 100;
    //background(0);
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  }
  if(keyPressed == true && key =='l')
  {
    // println("CameraY is " + cameraY);
    cameraY += 100;
    //background(0);
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  }
  if(keyPressed == true && key == 'q')
  {
    c += .1;
    println(c);
  }
  if(keyPressed == true && key == 'e')
  {
    c -= .1;
    println(c);
  }
  for(int i = 0; i < 10; i++)
  {
    building1[i].show();
    building1[i].drawWindows();
  }
  for(int i = 0; i < 10; i++)
  {
    building2[i].show();
    // rotateY(PI);
    building2[i].drawWindows();
    // rotateY(-PI);
  }
  for(int i = 0; i < 10; i++)
  {
    building3[i].show();
    // rotateY(PI);
    building3[i].drawWindows();
    // rotateY(-PI);
  }
  for(int i = 0; i < 10; i++)
  {
    building4[i].show();
    // rotateY(PI);
    building4[i].drawWindows();
    // rotateY(-PI);
  }
  for(int i = 0; i < 100; i++)
  {
    star1[i].show();
  }
  cameraControl();
  translate(0,-1000,0);
  moon1.show();
  moon1.move();
  translate(0,1000,0);
  camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
}

void keyTyped()
{
  redraw();
}
void cameraControl()
{
  if(key == ENTER && keyPressed == true)
  {
    cameraX = width/2.0 + 900;
    cameraY = height/2.0;
    cameraZ = -800;
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
    redraw();
  }
}
void mouseDragged()
{
  //background(0);
  if(mouseButton == LEFT)
  {
    if(mouseX < 250)
    {
      pointCameraX += 10;
    }
    else
    {
      pointCameraX -= 10;
    }
    if(mouseY < 100)
    {
      pointCameraY -= 10;
    }
    else if(mouseY > 400)
    {
      pointCameraY += 10;
    }
    println("pointX is " + pointCameraX);
    println("pointZ is " + pointCameraZ);
    camera(cameraX, cameraY, cameraZ, pointCameraX, pointCameraY, pointCameraZ, a, b, c);
  }
  if(mouseButton == RIGHT)
  {
    if(mouseX < 250)
    {
      pointCameraZ += 10;
    }
    if(mouseX > 250)
    {
      pointCameraZ -= 10;
    }
  }
  redraw();
}
/*
void sideOne()
 {
 for(int i = 0; i < 10; i++)
 {
 building1[i] = new Building();
 }
 }*/


class Building
{
  int w; //dimensions
  int h;
  int d;
  int x; //pos
  int y;
  int z;
  color shade;

  void show()
  {
    fill(shade);
    noStroke();
    //rotate(PI);
    translate(x,y,z);
    box(w,h,d);
    //rotate(-HALF_PI);
    translate(-x,-y,-z);
    redraw();
  }
  void drawWindows()
  {
    int i = y + 40;
    translate(0,0,70);
    do
    {
      image(window,x - 37,i);
      i -= 90;
    }
    while(i > y - h/2);
    translate(0,0,-70);
    redraw();
  }

  Building()
  {
    shade = color(int(random(255)),int(random(255)),int(random(255)));
    w = int(random(75,150));
    h = int(random(200,550));
    d = 50;
    x = lastX + lastW;
    y = -h/2 + 500;
    z = 100;
    lastX = x + 10;
    lastW = w;
  }
}

class OtherBuilding extends Building
{
  OtherBuilding()
  {
    shade = color(int(random(255)),int(random(255)),int(random(255)));
    w = 50;
    h = int(random(200,550));
    d = int(random(75,150));
    x = building1[9].x + 100;
    y = -h/2 + 500;
    z = lastZ1 - lastD1 - 20;
    lastZ1 = z - 10;
    lastD1 = d - 20;
  }
  void drawWindows()
  {
    int i = y + 40;
    rotateY(3*(PI/2));
    translate(-30,0,-1155);
    do
    {
      image(window,z,i);
      i -= 90;
    }
    while(i > y - h/2);
    translate(30,0,1155);
    rotateY(-(3*(PI/2)));
    redraw();
  }
}

class OtherBuilding2 extends Building
{
  OtherBuilding2()
  {
    shade = color(int(random(255)),int(random(255)),int(random(255)));
    w = int(random(75,150));
    h = int(random(200,550));
    d = 50;
    x = lastX + lastW;
    y = -h/2 + 500;
    z = 100;
    lastX = x - w;
    lastW = w;
  }

  void show()
  {
    fill(shade);
    noStroke();
    translate(x - 2500,y,z - 1300);
    box(w,h,d);
    translate(-(x - 2500),-y,-(z - 1300));
    redraw();
  }
  void drawWindows()
  {
    int i = y + 40;
    translate(-2550,0,-1150);
    do
    {
      image(window,x + 37,i);
      i -= 90;
    }
    while(i > y - h/2);
    translate(2550,0,1150);
    redraw();
  }
}

class OtherBuilding3 extends Building
{
  OtherBuilding3()
  {
    shade = color(int(random(255)),int(random(255)),int(random(255)));
    w = 50;
    h = int(random(200,550));
    d = int(random(75,150));
    x = building1[0].x + 100;
    y = -h/2 + 500;
    z = lastZ1 - lastD1 - 20;
    lastZ1 = z - 10;
    lastD1 = d - 20;
  }
  void show()
  {
    fill(shade);
    noStroke();
    translate(x - 250,y,z + 1200);
    box(w,h,d);
    translate(-(x - 250),-y,-(z+1200));
    redraw();
  }
  void drawWindows()
  {
    int i = y + 40;
    rotateY(3*(PI/2));
    translate(1200,0,100);
    do
    {
      image(window,z,i);
      i -= 90;
    }
    while(i > y - h/2);
    translate(-1200,0,-100);
    rotateY(-(3*(PI/2)));
    redraw();
  }
}

class Star
{
  int x;
  int y;
  int z;
  int radius;

  Star()
  {
    x = int(random(-2000,1100));
    y = int(random(-750,-500));
    z = int(random(-1300,1900));
    radius = 10;
  }

  void show()
  {
    fill(255);
    rotateY(PI);
    translate(x,y,z);
    sphere(radius);
    translate(10,0,0);
    box(20,1,1);
    translate(-10,0,0);
    translate(0,10,0);
    box(1,20,1);
    translate(0,-10,0);
    translate(0,0,20);
    box(1,1,20);
    translate(0,0,-20);
    translate(-20,0,0);
    box(20,1,1);
    translate(20,0,0);
    translate(0,-20,0);
    box(1,20,1);
    translate(0,20,0);
    translate(0,0,-20);
    box(1,1,20);
    translate(0,0,20);
    translate(-20,-0,-20);
    box(1,1,20);
    translate(20,0,20);
    translate(0,-20,-20);
    box(1,1,20);
    translate(0,20,20);
    translate(-20,-0,-20);
    box(1,1,20);
    translate(20,0,20);
    translate(-x,-y,-z);
    rotateY(-PI);
  }
}

class Moon
{
  int radius;
  float theta;
  float speed;
  int size1;
  Moon()
  {
    theta = random(0,2*PI);
    radius = 1000;
    speed = random(0,.1);
    size1 = int(random(300,400));
  }
  void show()
  {
    fill(255);
    float x;
    float z;
    x = int(radius*cos(theta)) + width/2.0;
    z = int(radius*sin(theta)) + width/2.0;
    translate(x,0,z);
    sphere(size1);
    translate(-x, 0, -z);
    println(x + "    " + z);
  }
  void move()
  {
    theta += speed;
  }
}

