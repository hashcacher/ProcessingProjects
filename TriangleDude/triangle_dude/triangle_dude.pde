//Gregory Guterman, Comp Prog 4/5. Triangle dude
/* Triangle Dude!
 WASD to move.
 Hit red dots but avoid crashing into white dots.
 Try to guess how the scoring works!
 */

import ddf.minim.*;

AudioPlayer player;
int a = 150;//triangle
int a1 = 150;
int b1 = 130;
int b = 130;
int c = 130;
int c1 = 180;
int score = 0;
boolean obstaclex1 = true;
boolean obstaclex2 = false;
boolean obstaclex3 = false;
boolean obstaclex4 = false;
boolean obstaclex5 = false;
boolean obstaclex6 = false;
boolean obstaclex7 = false;
boolean obstaclex8 = false;
boolean obstaclex9 = false;
boolean obstaclex10 = false;
int rand1 = 50; //dotsx
int rand2 = 50;//dotsy
int rand3 = int(random(30,470)); // obstance1x
int rand4 = int(random(30,470));//obstacle1y
int rand5 = int(random(5,50)); //obstacle1width
int rand6 = int(random(5,50)); //obstacle1height
int rand7 = int(random(30,470)); // obstance2x
int rand8 = int(random(30,470));//obstacle2y
int rand9 = int(random(5,50)); //obstacle2width
int rand10 = int(random(5,50)); //obstacle2height
int rand11 = int(random(30,470)); // obstance3x
int rand12 = int(random(30,470));//obstacle3y
int rand13 = int(random(5,50)); //obstacle3width
int rand14 = int(random(5,50)); //obstacle3heightint
int rand15 = int(random(30,470)); // obstance4x
int rand16 = int(random(30,470));//obstacle4y
int rand17 = int(random(5,50)); //obstacle4width
int rand18 = int(random(5,50)); //obstacle4height
int rand19 = int(random(30,470)); // obstance4x
int rand20 = int(random(30,470));//obstacle4y
int rand21 = int(random(5,50)); //obstacle4width
int rand22 = int(random(5,50)); //obstacle4height
int rand23 = int(random(30,470));//obstacle4y
int rand24 = int(random(30,470)); //obstacle4width
int rand25 = int(random(5,50)); //obstacle4height
int rand26 = int(random(5,50));//obstacle4y
int rand27 = int(random(30,470)); //obstacle4width
int rand28 = int(random(30,470)); //obstacle4height
int rand29 = int(random(5,50)); // obstance4x
int rand30 = int(random(5,50));//obstacle4y
int rand31 = int(random(30,470)); //obstacle4width
int rand32 = int(random(30,470)); //obstacle4height
int rand33 = int(random(5,50)); // obstance4x
int rand34 = int(random(5,50));//obstacle4y
int rand35 = int(random(30,470)); //obstacle4width
int rand36 = int(random(30,470)); //obstacle4height
int rand37 = int(random(5,50)); // obstance4x
int rand38 = int(random(5,50));//obstacle4y
int rand39 = int(random(30,470)); //obstacle4width
int rand40 = int(random(30,470)); //obstacle4height
int rand41 = int(random(5,50)); //obstacle4width
int rand42 = int(random(5,50)); //obstacle4height
boolean check1 = false;
boolean check1b = false;
boolean check1c = false;
boolean check1d = false;
boolean check1e = false;
boolean check2 = false;
boolean check2b = false;
boolean check2c = false;
boolean check2d = false;
boolean check2e = false;
boolean check3 = false;
boolean check3b = false;
boolean check3c = false;
boolean check3d = false;
boolean check3e = false;
boolean check4 = false;
boolean check4b = false;
boolean check4c = false;
boolean check4d = false;
boolean check4e = false;
boolean check5 = false;
boolean check5b = false;
boolean check5c = false;
boolean check5d = false;
boolean check5e = false;
boolean check6 = false;
boolean check6b = false;
boolean check6c = false;
boolean check6d = false;
boolean check6e = false;
boolean check7 = false;
boolean check7b = false;
boolean check7c = false;
boolean check7d = false;
boolean check7e = false;
boolean check8 = false;
boolean check8b = false;
boolean check8c = false;
boolean check8d = false;
boolean check8e = false;
boolean check9 = false;
boolean check9b = false;
boolean check9c = false;
boolean check9d = false;
boolean check9e = false;
boolean check10 = false;
boolean check10b = false;
boolean check10c = false;
boolean check10d = false;
boolean check10e = false;
boolean targetcheck = false;
boolean overlap = false;
char previouskey = ' ';

void setup()
{
//  Minim.start(this);
//  player = Minim.loadFile("Yo vivire.mp3", 512);
//  player.play();
  frameRate(25);
  size(500,500);
  PFont font;
  font = loadFont("ErasITC-Bold-18.vlw");
  textFont(font);
  background(0);
}

void draw()
{
  background(0);
  noFill();
  stroke(0,0,255);
  strokeWeight(10);
  rect(0,0,500,500);
  obstacle1();
  obstacle2();
  obstacle3();
  obstacle4();
  obstacle5();
  obstacle6();
  obstacle7();
  obstacle8();
  obstacle9();
  obstacle10();
  drawtargets();
  drawsnake();
  checkobstacle1();
  checkobstacle2();
  checkobstacle3();
  checkobstacle4();
  checkobstacle5();
  checkobstacle6();
  checkobstacle7();
  checkobstacle8();
  checkobstacle9();
  checkobstacle10();
  score();
  updatetargets();
  checkwalls();
  movesnake();
  nooverlap();
  nocheating();
}
void nocheating()
{
  if(key != 'w' && key != 'a' && key != 's' && key != 'd' && key != ' ')
  {
    key = previouskey;
  }
}

void nooverlap()
{
  overlap = get(rand1,rand2)==color(255,255,255);
  if (overlap == true)
  {
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
  }
}

void drawsnake()
{
  noStroke();
  fill(0,255,0);
  triangle(a,a1,b,b1,c,c1);

}

void movesnake()
{
  if(keyPressed = true && key == 'w')
  {
    a1 = a1 - 10;
    previouskey = 'w';
  }

  if(keyPressed = true && key == 'a')
  {
    a = a - 10;
    previouskey = 'a';
  }

  if(keyPressed = true && key == 's')
  {
    a1 = a1 + 10;
    previouskey = 's';
  }
  if(keyPressed = true && key == 'd')
  {
    a = a + 10;
    previouskey = 'd';
  }

  if(a1 == b1 + 10 || a1 == c1 - 30)
  {
    b = a - 20;
    b1 = a1 + 20;
    c = a + 20;
    c1 = a1 + 20;
  }
  if (a == b + 10 || a == c - 30)
  {
    c = a + 20;
    c1 = a1 - 20;
    b = a  + 20;
    b1 = a1 + 20;
  }
  if(a1 == b1 - 10 || a1 == c1 + 30)
  {
    c = a - 20;
    c1 = a1 - 20;
    b = a + 20;
    b1 = a1 - 20;
  }
  if(a == b - 10 || a == c + 30)
  {
    b = a - 20;
    b1 = a1 - 20;
    c = a - 20;
    c1 = a1 + 20;
  }
  if(a == b - 30 || a == c - 10)
  {
    c = a + 20;
    c1 = a1 + 20;
    b = a + 20;
    b1 = a1 - 20;
  }
  if(a1 == b1-30 ||a1 == c + 10)
  {
    b = a - 20;
    b1 = a1 +20;
    c = a + 20;
    c1 = a1 + 20;
  }
  if(a1 == b1 + 30 || a1 == c1 - 10)
  {
    b = a + 20;
    b1 = a1 - 20;
    c = a - 20;
    c1 = a1 - 20;
  }
}

void updatetargets()
{
  targetcheck = get(rand1,rand2)==color(0,255,0);
  if(targetcheck == true)
  {
    score++;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
  }
}

void drawtargets()
{
  fill(255,0,0);
  noStroke();
  ellipse(rand1,rand2,10,10);
}
void score()
{
  fill(255);
  text(Integer.toString(score,2),370,490);
}

void checkwalls()
{

  if(a > 500 || a < 0 || a1 > 500 || a1 < 0)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,10));
    rand6 = int(random(5,10));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,10));
    rand10 = int(random(5,10));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,10));
    rand14 = int(random(5,10));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,10));
    rand18 = int(random(5,10));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,10));
    rand22 = int(random(5,10));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,10));
    rand26 = int(random(5,10));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,10));
    rand30 = int(random(5,10));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,10));
    rand34 = int(random(5,10));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,10));
    rand38 = int(random(5,10));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,10));
    rand42 = int(random(5,10));
    key = ' ';
  }
}

void obstacle1()
{
  if(score < 10)
  {
    obstaclex1 = true;
  }
  if(obstaclex1 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand3,rand4,rand5,rand6);
  }

}

void obstacle2()
{
  if(score >= 3)
  {
    obstaclex2 = true;
  }
  if(obstaclex2 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand7,rand8,rand9,rand10);
  }
}

void obstacle3()
{
  if(score >= 5)
  {
    obstaclex3 = true;
  }
  if(obstaclex3 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand11,rand12,rand13,rand14);
  }
}

void obstacle4()
{
  if(score >= 7)
  {
    obstaclex4 = true;
  }
  if(obstaclex4 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand15,rand16,rand17,rand18);
  }
}

void obstacle5()
{
  if(score >= 12)
  {
    obstaclex5 = true;
  }
  if(obstaclex5 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand19,rand20,rand21,rand22);
  }
}
void obstacle6()
{
  if(score >= 18)
  {
    obstaclex6 = true;
  }
  if(obstaclex6 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand23,rand24,rand25,rand26);
  }
}

void obstacle7()
{
  if(score >= 26)
  {
    obstaclex7 = true;
  }
  if(obstaclex7 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand27,rand28,rand29,rand30);
  }
}

void obstacle8()
{
  if(score >= 34)
  {
    obstaclex8 = true;
  }
  if(obstaclex8 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand31,rand32,rand33,rand34);
  }
}

void obstacle9()
{
  if(score >= 42)
  {
    obstaclex9 = true;
  }
  if(obstaclex9 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand35,rand36,rand37,rand38);
  }
}

void obstacle10()
{
  if(score >= 50)
  {
    obstaclex10 = true;
  }
  if(obstaclex10 == true)
  {
    fill(255);
    noStroke();
    ellipse(rand39,rand40,rand41,rand42);
  }
}

void checkobstacle1()
{
  check1 = get(rand3,rand4)==color(0,255,0);
  check1b = get(rand3 + rand5,rand4)==color(0,255,0);
  check1c = get(rand3 - rand5,rand4)==color(0,255,0);
  check1d = get(rand3,rand4 + rand6)==color(0,255,0);
  check1e = get(rand3,rand4 - rand6)==color(0,255,0);

  if(check1 == true || check1b == true || check1c == true || check1d == true || check1e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,10));
    rand6 = int(random(5,10));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,10));
    rand10 = int(random(5,10));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,10));
    rand14 = int(random(5,10));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,10));
    rand18 = int(random(5,10));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,10));
    rand22 = int(random(5,10));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,10));
    rand26 = int(random(5,10));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,10));
    rand30 = int(random(5,10));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,10));
    rand34 = int(random(5,10));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,10));
    rand38 = int(random(5,10));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,10));
    rand42 = int(random(5,10));
    key = ' ';
    check1 = false;
    check1b = false;
    check1c = false;
    check1d = false;
    check1e = false;
  }
}

void checkobstacle2()
{
  if (obstaclex2 == true)
  {
    check2 = get(rand7,rand8)==color(0,255,0);

    check2b = get(rand7 + rand9,rand8)==color(0,255,0);
    check2c = get(rand7 - rand9,rand8)==color(0,255,0);
    check2d = get(rand7,rand8 + rand10)==color(0,255,0);
    check2e = get(rand7,rand8 - rand10)==color(0,255,0);
  }
  if(check2 == true || check2b == true || check2c == true || check2d == true || check2e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,10));
    rand6 = int(random(5,10));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,10));
    rand10 = int(random(5,10));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,10));
    rand14 = int(random(5,10));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,10));
    rand18 = int(random(5,10));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,10));
    rand22 = int(random(5,10));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,10));
    rand26 = int(random(5,10));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,10));
    rand30 = int(random(5,10));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,10));
    rand34 = int(random(5,10));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,10));
    rand38 = int(random(5,10));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,10));
    rand42 = int(random(5,10));
    key = ' ';
    check2 = false;
    check2b = false;
    check2c = false;
    check2d = false;
    check2e = false;
  }
}

void checkobstacle3()
{
  if (obstaclex3 == true)
  {
    check3 = get(rand11,rand12)==color(0,255,0);
    check3b = get(rand11 + rand13,rand12)==color(0,255,0);
    check3c = get(rand11 - rand13,rand12)==color(0,255,0);
    check3d = get(rand11,rand12 + rand14)==color(0,255,0);
    check3e = get(rand11,rand12 - rand14)==color(0,255,0);
  }
  if(check3 == true || check3b == true || check3c == true || check3d == true || check3e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check3 = false;
    check3b = false;
    check3c = false;
    check3d = false;
    check3e = false;
  }
}

void checkobstacle4()
{
  if (obstaclex4 == true)
  {
    check4 = get(rand15,rand16)==color(0,255,0);
    check4b = get(rand15 + rand17,rand16)==color(0,255,0);
    check4c = get(rand15 - rand17,rand16)==color(0,255,0);
    check4d = get(rand15,rand16 + rand18)==color(0,255,0);
    check4e = get(rand15,rand16 - rand18)==color(0,255,0);
  }
  if(check4 == true || check4b == true || check4c == true || check4d == true || check4e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check4 = false;
    check4b = false;
    check4c = false;
    check4d = false;
    check4e = false;
  }
}

void checkobstacle5()
{
  if (obstaclex5 == true)
  {
    check5 = get(rand19,rand20)==color(0,255,0);
    check5b = get(rand19 + rand21,rand20)==color(0,255,0);
    check5c = get(rand19 - rand21,rand20)==color(0,255,0);
    check5d = get(rand19,rand20 + rand22)==color(0,255,0);
    check5e = get(rand19,rand20 - rand22)==color(0,255,0);
  }
  if(check5 == true || check5b == true || check5c == true || check5d == true || check5e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check5 = false;
    check5b = false;
    check5c = false;
    check5d = false;
    check5e = false;
  }
}

void checkobstacle6()
{
  if (obstaclex6 == true)
  {
    check6 = get(rand23,rand24)==color(0,255,0);
    check6b = get(rand23 + rand25,rand24)==color(0,255,0);
    check6c = get(rand23 - rand25,rand24)==color(0,255,0);
    check6d = get(rand23,rand24 + rand26)==color(0,255,0);
    check6e = get(rand23,rand24 - rand26)==color(0,255,0);
  }

  if(check6 == true || check6b == true || check6c == true || check6d == true || check6e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check6 = false;
    check6b = false;
    check6c = false;
    check6d = false;
    check6e = false;
  }
}

void checkobstacle7()
{
  if (obstaclex7 == true)
  {
    check7 = get(rand27,rand28)==color(0,255,0);
    check7b = get(rand27 + rand29,rand28)==color(0,255,0);
    check7c = get(rand27 - rand29,rand28)==color(0,255,0);
    check7d = get(rand27,rand28 + rand30)==color(0,255,0);
    check7e = get(rand27,rand28 - rand30)==color(0,255,0);
  }
  if(check7 == true || check7b == true || check7c == true || check7d == true || check7e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check7 = false;
    check7b = false;
    check7c = false;
    check7d = false;
    check7e = false;
  }
}

void checkobstacle8()
{
  if (obstaclex8 == true)
  {
    check8 = get(rand31,rand32)==color(0,255,0);
    check8b = get(rand31 + rand33,rand32)==color(0,255,0);
    check8c = get(rand31 - rand33,rand32)==color(0,255,0);
    check8d = get(rand31,rand32 + rand34)==color(0,255,0);
    check8e = get(rand31,rand32 - rand34)==color(0,255,0);
  }
  if(check8 == true || check8b == true || check8c == true || check8d == true || check8e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check8 = false;
    check8b = false;
    check8c = false;
    check8d = false;
    check8e = false;
  }
}
void checkobstacle9()
{
  if (obstaclex9 == true)
  {
    check9 = get(rand35,rand36)==color(0,255,0);
    check9b = get(rand35 + rand37,rand36)==color(0,255,0);
    check9c = get(rand35 - rand37,rand36)==color(0,255,0);
    check9d = get(rand35,rand36 + rand38)==color(0,255,0);
    check9e = get(rand35,rand36 - rand38)==color(0,255,0);
  }
  if(check9 == true || check9b == true || check9c == true || check9d == true || check9e == true)
  {
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check9 = false;
    check9b = false;
    check9c = false;
    check9d = false;
    check9e = false;
  }
}

void checkobstacle10()
{
  if (obstaclex10 == true)
  {
    check10 = get(rand39,rand40)==color(0,255,0);
    check10b = get(rand39 + rand41,rand40)==color(0,255,0);
    check10c = get(rand39 - rand41,rand40)==color(0,255,0);
    check10d = get(rand39,rand40 + rand42)==color(0,255,0);
    check10e = get(rand39,rand40 - rand42)==color(0,255,0);
  }
  if(check10 == true || check10b == true || check10c == true || check10d == true || check10e == true)
  {  
    score = 0;
    a = 170;
    a1 = 150;
    b1 = 130;
    b = 150;
    c = 150;
    c1 = 170;
    obstaclex2 = false;
    obstaclex3 = false;
    obstaclex4 = false;
    obstaclex5 = false;
    obstaclex6 = false;
    obstaclex7 = false;
    obstaclex8 = false;
    obstaclex9 = false;
    obstaclex10 = false;
    rand1 = int(random(30,470));
    rand2 = int(random(30,470));
    rand3 = int(random(30,470));
    rand4 = int(random(30,470));
    rand5 = int(random(5,50));
    rand6 = int(random(5,50));
    rand7 = int(random(30,470));
    rand8 = int(random(30,470));
    rand9 = int(random(5,50));
    rand10 = int(random(5,50));
    rand11 = int(random(30,470));
    rand12 = int(random(30,470));
    rand13 = int(random(5,50));
    rand14 = int(random(5,50));  
    rand15 = int(random(30,470));
    rand16 = int(random(30,470));
    rand17 = int(random(5,50));
    rand18 = int(random(5,50));  
    rand19 = int(random(30,470));
    rand20 = int(random(30,470));
    rand21 = int(random(5,50));
    rand22 = int(random(5,50));  
    rand23 = int(random(30,470));
    rand24 = int(random(30,470));
    rand25 = int(random(5,50));
    rand26 = int(random(5,50));  
    rand27 = int(random(30,470));
    rand28 = int(random(30,470));
    rand29 = int(random(5,50));
    rand30 = int(random(5,50));  
    rand31 = int(random(30,470));
    rand32 = int(random(30,470));
    rand33 = int(random(5,50));
    rand34 = int(random(5,50));  
    rand35 = int(random(30,470));
    rand36 = int(random(30,470));
    rand37 = int(random(5,50));
    rand38 = int(random(5,50));  
    rand39 = int(random(30,470));
    rand40 = int(random(30,470));
    rand41 = int(random(5,50));
    rand42 = int(random(5,50));
    key = ' ';
    check10 = false;
    check10b = false;
    check10c = false;
    check10d = false;
    check10e = false;
  }
}

void stop()
{
  player.close();
 // super.stop();
}

