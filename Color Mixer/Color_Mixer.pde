//Gregory Guterman, Comp Prog 2 4/5, Assignment 5: Color Mixer

import interfascia.*;

Button[] buttons;
GUIController c;
IFTextField t;

boolean setLoc = true;
boolean setWidth = false;
boolean setHeight = false;
boolean setColors = false;
boolean switch1 = true;
int preLocationX;
int preLocationY;
int preWidth1;
int preHeight1;
int preBorderWeight;
int setFunction = -1;
int buttonsMade = 0;
color preBackgroundColor;
color preBorderColor;
color preTextColor;
String preWords;

boolean allButtonsMade = false;
boolean mixerMode = false;
int mixX;
int mixY;
int amountRed = 150;
int amountBlue = 150;
int amountGreen = 150;

void setup()
{
  size(500,500);
  c = new GUIController(this);
  noLoop();
  background(0);
  fill(255);
  text("Click where you want the button to be", 10,10);
  buttons = new Button[6];
  text("In this applet, you must first make 6 of your own buttons before you can begin mixing color.\n Just follow the on screen instructions and you should do fine",10,250);
}
void draw()
{
  if(mixerMode == true)
  {
    showMixedColor();
  }
  if(allButtonsMade == false && mixerMode == false)
  {
    makeButton();
  }
  if(allButtonsMade == true)
  {
    setMixerLoc();
  }
  if(buttonsMade >= 1)
  {
    buttons[0].show();
    buttons[0].changeMixVars();
  }
  if(buttonsMade >= 2)
  {
    buttons[1].show();
    buttons[1].changeMixVars();
  }
  if(buttonsMade >= 3)
  {
    buttons[2].show();
    buttons[2].changeMixVars();
  }
  if(buttonsMade >= 4)
  {
    buttons[3].show();
    buttons[3].changeMixVars();
  }
  if(buttonsMade >= 5)
  {
    buttons[4].show();
    buttons[4].changeMixVars();
  }
  if(buttonsMade >= 6)
  {
    buttons[5].show();
    buttons[5].changeMixVars();
  }
}

void setMixerLoc()
{
  background(0);
  fill(255);
  c.remove(t);
  text("Finally you're done making all the buttons, lastly, you need to chooose a location\n for the mixer, where you will see the results of your color mixing endeavors.\n Just point and click to choose a spot",5,10);
}
void makeButton()
{
  if(preTextColor != 0)
  {
    setFunction++;
    if(setFunction == 0)
    {
      preWords = "More Red";
    }
    else if(setFunction == 1)
    {
      preWords = "Less Red";
    }
    else if(setFunction == 2)
    {
      preWords = "More Green";
    }
    else if(setFunction == 3)
    {
      preWords = "Less Green";
    }
    else if(setFunction == 4)
    {
      preWords = "More Blue";
    }
    else if(setFunction == 5)
    {
      preWords = "Less Blue";
      allButtonsMade = true;
    }
    buttons[buttonsMade] = new Button(preLocationX,preLocationY, preWidth1, preHeight1, preBackgroundColor, preBorderColor, preBorderWeight, preTextColor, preWords, setFunction);
    buttonsMade++;
    preTextColor = 1;
    preLocationX = 0;
    preLocationY = 0;
    preWidth1 = 0;
    preHeight1 = 0;
    preBorderWeight = 0;
    preBackgroundColor = 0;
    preBorderColor = 0;
    preTextColor = 0;
    preWords = "";
    setLoc = true;
    switch1 = true;
    setColors = false;
    noLoop();
    fill(255);
    text("Click where you want the button to be", 10,10);
  }
}

void showMixedColor()
{ 
  background(0);
  fill(amountRed,amountGreen,amountBlue);
  stroke(amountRed,amountGreen,amountBlue);
  rect(mixX,mixY, 50,50);
  fill(255);
  text("Red:           " + amountRed + "            Green:            " + amountGreen + "            Blue:             " + amountBlue, 10,490);
}

void mouseClicked()
{
  if(setLoc == true)
  {
    c.remove(t);
    background(0);
    fill(255);
    text("Click where you want the button to be", 10,10);
    preLocationX = mouseX;
    preLocationY = mouseY;
    ellipse(preLocationX,preLocationY,10,10);
    setLoc = false;
    setWidth = true;
    background(0);
    stroke(255);
    ellipse(preLocationX,preLocationY,5,5);
    text("Next, drag the line right to select how wide you want the button to be, then press ENTER", 10,10);
    line(preLocationX,preLocationY,preLocationX + 30, preLocationY);
    redraw();
  }
  if(allButtonsMade == true)
  {
    mixX = mouseX;
    mixY = mouseY;
    allButtonsMade  = false;
    mixerMode = true;
  }
  if(mixerMode == true)
  {
    for(int i = 0; i < buttonsMade; i++)
    {
      if(mouseX >= buttons[i].locationX && mouseX <= buttons[i].locationX + buttons[i].width1 && mouseY >= buttons[i].locationY && mouseY <= buttons[i].locationY + buttons[i].height1)
      {
        buttons[i].pressed = true;
        redraw();
      }
    }
  }
}

void mouseDragged()
{
  if(setWidth == true)
  {
    background(0);
    setLoc = false;
    ellipse(preLocationX,preLocationY,5,5);
    fill(255);
    text("Next, drag the line right to select how wide you want the button to be, then press ENTER", 10,10);
    fill(255);
    stroke(255);
    line(preLocationX,preLocationY,mouseX,preLocationY);
    preWidth1 = abs(mouseX - preLocationX);
    redraw();
  }
  if(setHeight == true)
  {
    background(0);
    setLoc = false;
    ellipse(preLocationX,preLocationY,5,5);
    fill(255);
    text("Drag the line down to select how high you want the button to be, then press ENTER twice", 3,10);
    line(preLocationX,preLocationY,preLocationX + preWidth1,preLocationY);
    line(preLocationX,preLocationY,preLocationX,mouseY);
    preHeight1 = abs(mouseY - preLocationY);
    redraw();
  }
}

void keyTyped()
{
  if(setWidth == true)
  {
    if(key == ENTER)
    {
      background(0);
      fill(255);
      text("Drag the line down to select how high you want the button to be, then press ENTER twice", 3,10);
      line(preLocationX,preLocationY,preLocationX + preWidth1,preLocationY);
      line(preLocationX,preLocationY,preLocationX,preLocationY + 30);
      setWidth = false;
      setHeight = true;
      key = '0';
      redraw();
    }
  }
  else if(setHeight == true)
  {
    if(key == ENTER)
    {
      setHeight = false;
      setColors = true;
      loop();
    }
  }
  else if(setColors == true && preBackgroundColor == 0)
  {
    background(0);
    stroke(255);
    fill(255);
    text("Type in the color you want the background to be, then press ENTER",25,10);
    if(switch1 == true)
    {
      setWidth = false;
      fill(255);
      text("Type in the color you want the background to be, then press ENTER",25,10);
      switch1 = false;
      t = new IFTextField("Text Field", 100, 30, 150);
      c.add(t);
      t.addActionListener(this);
    }
  }
  else if(preBackgroundColor != 0 && preBorderColor == 0)
  {
    setWidth = false;
    setHeight = false;
    background(0);
    fill(255);
    text("Type in the color you want the border to be, then press ENTER",25,10);
  }
  else if(preBorderColor != 0 && preTextColor == 0)
  {
    setWidth = false;
    setHeight = false;
    background(0);
    fill(255);
    text("Type in the color you want the text to be, then press ENTER",25,10);
  }
}

void actionPerformed(GUIEvent e) 
{
  background(0);
  if (e.getMessage().equals("Completed")) 
  {
    if(preBackgroundColor == 0)
    {
      background(0);
      setHeight = false;
      preBackgroundColor = convertColor(t.getValue());
      fill(255);
      text("Type in the color you want the border to be, then press ENTER",25,10);
    }
    else if(preBackgroundColor != 0 && preBorderColor == 0)
    {
      preBorderColor = convertColor(t.getValue());
      fill(255);
      text("Type in the color you want the text to be, then press ENTER",25,10);
    }
    else
    {
      preTextColor = convertColor(t.getValue());
      preWords = " pre words";
    }
  }
}

color convertColor(String e)
{
  if(e.equals("green"))
  {
    return color(0,255,0);
  }
  else if(e.equals("blue"))
  {
    return color(0,0,255);
  }
  else if(e.equals("red"))
  {
    return color(255,0,0);
  }
  else if(e.equals("yellow"))
  {
    return color(255,255,0);
  }
  else if(e.equals("purple"))
  {
    return color(160,32,240);
  }
  else if(e.equals("brown"))
  {
    return color(165,42,42);
  }
  else if(e.equals("orange"))
  {
    return color(255,165,0);
  }
  else if(e.equals("pink"))
  {
    return color(255,192,203);
  }
  else if(e.equals("black"))
  {
    return color(0);
  }
  else if(e.equals("white"))
  {
    return color(255);
  }
  else
  {
    return color(250,0,0);
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
  boolean moreRed;
  boolean lessRed;
  boolean moreGreen;
  boolean lessGreen;
  boolean moreBlue;
  boolean lessBlue;
  boolean pressed;
  String words;

  Button(int x, int y, int wide, int high, color bgColor, color brdrColor, int brdrWeight, color txtColor, String textInside, int function)
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
    textFont(font,12);
    if(function == 0)
    {
      moreRed = true;
    }
    else if(function == 1)
    {
      lessRed = true;
    }
    else if(function == 2)
    {
      moreGreen = true;
    }
    else if(function == 3)
    {
      lessGreen = true;
    }
    else if(function == 4)
    {
      moreBlue = true;
    }
    else if(function == 5)
    {
      lessBlue = true;
    }
  }
  void show()
  {
    fill(borderColor);
    stroke(borderColor);
    rect(locationX,locationY,width1,height1);
    fill(backgroundColor);
    stroke(backgroundColor);
    rect(locationX + 6, locationY + 6, width1 - 12, height1 - 12);
    fill(textColor);
    text(words,locationX + (width1/10),(locationY + height1) - (height1 / 2));
  }
  void changeMixVars()
  {
    if(moreRed == true && pressed == true)
    {
      amountRed += 10;
      pressed = false;
      redraw();
    }
    else if(lessRed == true && pressed == true)
    {
      amountRed -= 10;
      pressed = false;
      redraw();
    }
    else if(moreBlue == true && pressed == true)
    {
      amountBlue += 10;
      pressed = false;
      redraw();
    }
    else if(lessBlue == true && pressed == true)
    {
      amountBlue -= 10;
      pressed = false;
      redraw();
    }
    else if(moreGreen == true && pressed == true)
    {
      amountGreen += 10;
      pressed = false;
      redraw();
    }
    else if(lessGreen == true && pressed == true)
    {
      amountGreen -= 5;
      pressed = false;
      redraw();
    }
    amountRed = constrain(amountRed, 0,255);
    amountGreen = constrain(amountGreen, 0,255);
    amountBlue = constrain(amountBlue, 0,255);
  }
}

