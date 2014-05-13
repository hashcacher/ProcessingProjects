//Gregory Guterman, Comp Prog 2 4/5, Assignment 6: Audio Visualizer
import ddf.minim.*;

Minim minim;
AudioPlayer[] song = new AudioPlayer[10];
Visualizer bob;
Button[] buttons;
int activeSong = 0;
PFont titleFont;

void setup()
{
  smooth();
  size(500,500);
  titleFont = loadFont("KristenITC-Regular-36.vlw"); 
  minim = new Minim(this);
  buttons = new Button[10];
  song[0] = minim.loadFile("brace.wav");
  song[1] = minim.loadFile("comp1.wav");
  song[2] = minim.loadFile("comp2.wav");
  song[3] = minim.loadFile("cool.wav");
  song[4] = minim.loadFile("end of class.wav");
  song[5] = minim.loadFile("great job.wav");
  song[6] = minim.loadFile("lights.wav");
  song[7] = minim.loadFile("making sense.wav");
  song[8] = minim.loadFile("objects.wav");
  song[9] = minim.loadFile("variable.wav");
  song[0].play();
  textFont(titleFont);
  buttons[0] = new Button(10,50, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "Brace Yourselves");
  buttons[1] = new Button(340,50, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "CP1 Look Up");
  buttons[2] = new Button(10,148, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "CP2 Look Up");
  buttons[3] = new Button(10,245, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "Cool!");
  buttons[4] = new Button(10,342, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "End of Class");
  buttons[5] = new Button(10,440, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "Great Job!");
  buttons[6] = new Button(340,148, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "Lights");
  buttons[7] = new Button(340,245, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "Making Sense?");
  buttons[8] = new Button(340,342, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "Objects");
  buttons[9] = new Button(340,440, 150, 50, color(int(random(255)),int(random(255)),int(random(255))), color(int(random(255)),int(random(255)),int(random(255))), 3, color(0), "Variables");
  bob = new Visualizer(250,250);
}

void draw()
{
  background(0);
  title();
  bob.show();
  for(int i = 0; i <= 9; i++)
  {
    buttons[i].show();
  }
  playFiles();
}

void title()
{
  fill(255);
  textFont(titleFont);
  text("Mr. Simon Soundboard", 50,35);
}


void playFiles()
{
  for(int i = 0; i <= 9; i++)
  {
    if(buttons[i].pressed == true)
    {
      song[activeSong].pause();
      song[i].rewind();
      song[i].play();
      activeSong = i;
      buttons[i].pressed = false;
    }
  }
}

void mouseClicked()
{
  for(int i = 0; i <= 9; i++)
  {
    if(mouseX >= buttons[i].locationX && mouseX <= buttons[i].locationX + buttons[i].width1 && mouseY >= buttons[i].locationY && mouseY <= buttons[i].locationY + buttons[i].height1)
    {
      buttons[i].pressed = true;
    }
  }
}

class Visualizer
{
  int diameter;
  int centerX;
  int centerY;
  float rotateAmount;

  Visualizer(int x, int y)
  {
    diameter = 0;
    centerX = x;
    centerY = y;
    rotateAmount = 0;
  }

  void show()
  {
    float biggest = 0;
    for(int i = 0; i < song[activeSong].bufferSize(); i++)
    {
      if(song[activeSong].left.get(i) > biggest)
      {
        biggest = song[activeSong].left.get(i);
      }
    }
    diameter = int(80 * biggest);
    translate(centerX, centerY);
    rotate(rotateAmount);
    stroke(buttons[activeSong].borderColor);
    strokeWeight(3);
    fill(buttons[activeSong].backgroundColor);
    triangle(diameter, diameter, -diameter, diameter, 0, -diameter);
    rotate(-rotateAmount);
    translate(-centerX,-centerY);
    rotateAmount += .03;
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
}








