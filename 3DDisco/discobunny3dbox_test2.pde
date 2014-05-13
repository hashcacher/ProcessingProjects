//Gregory Guterman, Comp Prog 1, Assignment 7, Rotating Cube
/* Drag with left mouse button to rotate cube.
 Drag with right mouse button to move the cube.
 Click BOTH mouse buttons and drag to change perspective.
 Press the first letter of the color of one of the light bulbs and drag with left mouse button to move the light bulbs.
 Press enter to enter disco mode.
 Press spacebar to exit disco mode and freeze a color.
 Press backspace to bring back original colors.
 */
import ddf.minim.*;
import ddf.minim.analysis.*;

//the following class has been taken from a tutorial. i did not write it.
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}


AudioPlayer song;
BeatDetect beat;
BeatListener bl;
PImage bunny1;
PImage bunny2;
int bunnyposx = -250;
int bunnyposy = -250;
int z = 50;
float rotatex = 5;
float rotatey = 5;
float rotatez = 5;
float boxposx = 150;
float boxposy = 150;
int crazycolorr = 0;
int crazycolorg = 0;
int crazycolorb = 0;
boolean crazycolors = false;
boolean bunny1or2 = false;
int eyeX = 250;
int eyeY = 250;
boolean mbleft = false;
boolean mbright = false;
int light1x = 250;
int light1y = 70;
int light2x = 430;
int light2y = 250;
int light3x = 250;
int light3y = 430;
int light4x = 70;
int light4y = 250;

void setup()
{
  Minim.start(this);
  song = Minim.loadFile("It's a Beautiful Life.mp3", 1024);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(500);  
  bl = new BeatListener(beat, song);
  bunny1 = loadImage("bunny1.jpg");
  bunny2 = loadImage("bunny2.jpg");
  frameRate(10);
  size(500,500,P3D);
}

void draw()
{
  background(0);
  movecamera();
  drawbulbs();
  crazycolors();
  light();
  movebox();
  movered();
  moveblue();
  movegreen();
  moveyellow();
  rotatebox();
  drawbox();
}

void mousePressed()
{
  if(mouseButton==LEFT)
  {
    mbleft = true;
  }
  else if (mouseButton == RIGHT)
  {
    mbright = true;
  }
}
void mouseReleased()
{
  if(mouseButton == LEFT)
  {
    mbleft = false;
  }
  else if (mouseButton == RIGHT)
  {
    mbright = false;
  }
}

void movecamera()
{
  eyeX = mouseX;
  eyeY = mouseY;
  if(mousePressed == true && mbleft == true && mbright == true)
  {
    camera(eyeX,eyeY,500,250,250,0,0,1,0);
  }
}

void movebox()
{
    translate(boxposx,boxposy,z);
}

void light()
{
  if(crazycolors == true && key != BACKSPACE)
  {
    pointLight(crazycolorr,crazycolorg,crazycolorb,250,0,50);
    pointLight(crazycolorr,crazycolorg,crazycolorb,500,250,50);
    pointLight(crazycolorr,crazycolorg,crazycolorb,250,500,50);
    pointLight(crazycolorr,crazycolorg,crazycolorb,0,250,50);
    pointLight(255,255,255,250,250,2000);
    pointLight(255,255,255,250,250,-2000);
  }
  else if(key == BACKSPACE)
  {
    bunnyposx = -250;
    bunnyposy = -250;
    song.pause();
    song.rewind();
    crazycolors = false;
    pointLight(255,0,0,light1x,light1y,50);
    pointLight(0,255,0,light2x,light2y,50);
    pointLight(0,0,255,light3x,light3y,50);
    pointLight(255,255,0,light4x,light4y,50);
    pointLight(255,255,255,250,250,2000);
    pointLight(255,255,255,250,250,-2000);
  }
  else
  {
    pointLight(255,0,0,light1x,light1y,50);
    pointLight(0,255,0,light2x,light2y,50);
    pointLight(0,0,255,light3x,light3y,50);
    pointLight(255,255,0,light4x,light4y,50);
    pointLight(255,255,255,250,250,2000);
    pointLight(255,255,255,250,250,-2000);
  }
}



void movered()
{
  if(keyPressed == true && key == 'r' && mousePressed == true && mouseButton == LEFT)
  {
    light1x = mouseX;
    light1y = mouseY;
  }
}

void movegreen()
{
  if(keyPressed == true && key == 'g' && mousePressed == true && mouseButton == LEFT)
  {
    light2x = mouseX;
    light2y = mouseY;
  }

}

void moveblue()
{
  if(keyPressed == true && key == 'b' && mousePressed == true && mouseButton == LEFT)
  {
    light3x = mouseX;
    light3y = mouseY;
  }
}

void moveyellow()
{
  if(keyPressed == true && key == 'y' && mousePressed == true && mouseButton == LEFT)
  {
    light4x = mouseX;
    light4y = mouseY;
  }
}

void drawbox()
{
  fill(255);
  stroke(0);
  box(75);
}

void rotatebox()
{
  if(keyPressed == false)
  {
    rotateY(rotatex);
    rotateX(rotatey);
    rotateZ(rotatez);
  }
}


void drawbulbs()
{
  noStroke();
  if(crazycolors == true)
  {
    fill(crazycolorr,crazycolorg,crazycolorb);
  }
  else
  {
    fill(255,255,0);
  }
  translate(light4x,light4y,50);
  sphere(30);
  translate(-light4x,-light4y,-50);

  if(crazycolors == true)
  {
    fill(crazycolorr,crazycolorg,crazycolorb);
  }
  else
  {
    fill(0,255,0);
  }
  translate(light2x,light2y,50);
  sphere(30);
  translate(-light2x,-light2y,-50);

  if(crazycolors == true)
  {
    fill(crazycolorr,crazycolorg,crazycolorb);
  }
  else
  {
    fill(255,0,0);
  }
  translate(light1x,light1y,50);
  sphere(30);
  translate(-light1x,-light1y,-50);

  if(crazycolors == true)
  {
    fill(crazycolorr,crazycolorg,crazycolorb);
  }
  else
  {
    fill(0,0,255);
  }
  translate(light3x,light3y,50);
  sphere(30);
  translate(-light3x,-light3y,-50);
}
void mouseDragged()
{
  if(mousePressed == true && mouseButton == LEFT && mbright != true)
  {
    rotatex = mouseX/30.0;
    rotatey = mouseY/30.0;

  }
  if(mousePressed == true && mouseButton == RIGHT && mbleft != true)
  {
    boxposx = mouseX;
    boxposy = mouseY;
  }
}
void crazycolors()
{
  if(key == ENTER)
  {
    song.play();
    if (beat.isKick() ) 
    {
      bunnyposx = int(random(50,300)); 
      bunnyposy = int(random(50,300));
      bunny1or2 = !bunny1or2;
    }
    /*
    if (beat.isSnare() ) 
    {
      bunnyposx = int(random(50,300));
      bunnyposy = int(random(50,300));
      bunny1or2 = !bunny1or2;
    }
    if (beat.isHat() )
    {
      bunnyposx = int(random(50,300));
      bunnyposy = int(random(50,300));
      bunny1or2 = !bunny1or2;
    }
    */
    crazycolors = true;
    crazycolorr = int(random(0,256));
    crazycolorg = int(random(0,256));
    crazycolorb = int(random(0,256));
  }
  if(bunny1or2 == true)
  {
    image(bunny1,bunnyposx,bunnyposy);
  }
  else
  {
    image(bunny2,bunnyposx,bunnyposy);
  }
}

void stop()
{
  song.close();
  Minim.stop();
  super.stop();
}

