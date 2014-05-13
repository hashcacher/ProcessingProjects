//Gregory Guterman, Comp Prog 4,5, Assignment 13: Mind Reading Applet
boolean begin = false;
int textx = 13;
int texty = 110;
int x = 1;
PFont font;
char[] symbols = {
  '¡','¢','£','¤','¥','¦','§','¨','©','ª','«','¬','®','¯','°','±','´','µ','¶','»'};
char[] fixsymbols = new char[101];
int[] indexes = new int[101];
int j = 0;
char special = symbols[int(random(0,20))];


void setup()
{
  for(int i = 0; i < 101; i++)
  {
    indexes[i] = i;
  }
  size(300,300);
  background(0);
  font = loadFont("CalifornianFB-Reg-12.vlw");
  fill(255);
  stroke(255);
  textFont(font,12);
  textAlign(CENTER);
  for(int m = 0; m < 101; m++)
  {
    fixsymbols[m] = symbols[int(random(0,20))];
  }
  noLoop();
}

void draw()
{
  reset();
  phase1();
  phase2();
}

void phase1()
{
  if(begin == false)
  {
    loop();
    for(int k = 0; k < 100; k = k + 9)
    {
      fixsymbols[k] = special;
    }
    for(int i = 1; i < 101; i++)
    {
      if(j < 100)
      {
        j++;
      }
      text(indexes[j] + ": " + fixsymbols[i] + " ", textx,texty);
      textx = textx + 30;
      if(textx > 290)
      {
        textx = 13;
        texty = texty + 20;
      }
    }
    noLoop();
  }
}

void phase2()
{
  if(begin == true)
  {
    background(0);
    text("The symbol you are thinking of is " + special + "\n\n\n(Click here again to try it again)", 140,150);
  }
}

void reset()
{
  if(begin == false)
  {
    special = symbols[int(random(0,20))];
    text("Choose a two digit number. Then subtract the sum of the digits from the number. (For instance if you choose 93, 93 minus 12 would give you the answer.) Look up the symbol next to the answer, concentrate on the symbol, and click inside the applet. You will be amazed!",14,10,265,100);
    j = 0;
    textx = 10;
    texty = 110;
  }
}

void mousePressed()
{
  background(0);
  begin = !begin;
  redraw();
}

