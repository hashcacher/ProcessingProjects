//Gregory Guterman, Comp Prog 2 4/5, Assignment 2: Twenty-One Dice
Dice [] dice1;
PFont font;
int total = 0;
int column = 0;
int row = 0;
int numberRolls = 0;
int cumulativeTotal = 0;

void setup()
{
  size(450,150);
  background(255);
  dice1 = new Dice[21];
  for(int i = 0; i < 21; i++)
  {
    dice1[i] = new Dice();
  }
  font = loadFont("Georgia-16.vlw");
  textFont(font);
  noLoop();
}

void draw()
{
  for(int i = 0; i < 21; i++)
  {
    if(i%7 == 0 && i != 0)
    {
      column += 350;
      row += 50;
    }
    fill(int(random(255)),int(random(255)),int(random(255)));
    dice1[i].show(i*50 - column,row);
    total += dice1[i].value;
  }
  cumulativeTotal += total;
  numberRolls++;
  fill(0);
  text("You Rolled " + total,350,40);
  text("After " + numberRolls + " rolls,",350,60);
  text("your average",350,75);
  text("roll is " + cumulativeTotal /numberRolls ,353,90);
  text("Click to",357,120);
  text("roll again", 353, 134);
}

void mouseClicked()
{
  total = 0;
  for(int i = 0; i < 21; i++)
  {
    dice1[i].value = (int)(Math.random() * 6 + 1);
  }
  background(255);
  column = 0;
  row = 0;
  redraw();  
}
class Dice
{
  int value;

  Dice()
  {
    value = (int)(Math.random() * 6 + 1);
  }

  void show(int column, int row)
  {
    noStroke();
    rect(column,row,50,50);
    fill(255);
    for(int i = value; i > 0; i--)
    {
      ellipse(int(random(column + 5, column + 45)),int(random(row + 5,row + 45)),10,10);
    }
    redraw();
  }
}

