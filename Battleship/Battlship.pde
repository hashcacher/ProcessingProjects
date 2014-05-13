//Gregory Guterman, Comp Prog 2 4/5, Assignment 7: BattleShip

boolean setupShips;
int numberShipsSetUp = 5;
int otherCount = 0;
Board humanBoard;
CompBoard compBoard1;
Ship[] ship1;
CompShip[] compShip1; 
boolean preVertical;
boolean threeBoatMade;
int compShipCount = 5;
int otherCompCount = 0;
int preX;
int preY;
boolean compThreeBoatMade = false;
int preSize;
PFont font;
boolean setUpShips = true;
boolean setUpCompShips = true;
boolean humanTurn = true;
boolean someoneWon = false;
boolean humanWins = false;
boolean computerWins = false;
int turnsToProbe = 0;
int randomRow = 3;
int randomColumn = 3;
int lastRowHit = 0;
int lastColumnHit = 0;
int randomX = 0;
int randomY = 0;

void setup()
{
  font = loadFont("TimesNewRomanPSMT-12.vlw");
  textFont(font);
  humanBoard = new Board(0,0);
  compBoard1 = new CompBoard(300,0);
  ship1 = new Ship[5];
  compShip1 = new CompShip[5];
  size(550,340);
  background(0);
}

void draw()
{
  instructions();
  if(someoneWon == false)
  {
    if(setUpShips == false)
    {
      declareWinner();
    }
    if(humanTurn == false)
    {
      compMove();
    }
    if(setUpCompShips == true)
    {
      createCompShips();
    }
    humanBoard.drawSquares();
    compBoard1.drawSquares();
  }
}

void declareWinner()
{
  int numberLeft = 0;
  int compNumberLeft = 0;
  for(int i = 0; i <=9; i++)
  {
    for(int j = 0; j <=9; j++)
    {
      if(compBoard1.board[i][j] == 's')
      {
        compNumberLeft++;
      }
      if(humanBoard.board[i][j] == 's')
      {
        numberLeft++;
      }
    }
  }
  if(numberLeft == 0)
  {
    background(0);
    computerWins = true;
    fill(255);
    text("Computer wins", 200,300);
    someoneWon = true;
  }
  else if(compNumberLeft == 0)
  {
    background(0);
    fill(255);
    humanWins = true;
    someoneWon = true;
  }
}
void compMove()//here
{
  int probeY;
  int probeX;
  int [][] potentialTargets = new int[20][20];
  boolean useRandom;
  int randomX;
  int randomY;
  int tooManyTries = 0;

  if(turnsToProbe == 0)
  {
    do
    {
      randomRow = int(random(0,10));
      randomColumn = int(random(0,10));
    }
    while(humanBoard.board[randomRow][randomColumn] == 'h' || humanBoard.board[randomRow][randomColumn] == 'm');
    if(humanBoard.board[randomRow][randomColumn] == 'e')
    {
      humanBoard.board[randomRow][randomColumn] = 'm';
    }
    else if(humanBoard.board[randomRow][randomColumn] == 's')
    {
      humanBoard.board[randomRow][randomColumn] = 'h';
      lastRowHit = randomRow;
      lastColumnHit = randomColumn;
      turnsToProbe = 4;
    }
    humanTurn = true;
  }
  else
  {
    do
    {
      randomX = int(random(-2,2));
      randomY = int(random(-2,2));
      tooManyTries++;
      if(tooManyTries > 50)
      {
        break;
      }
    }
    while(randomX + randomY == -2 || randomX + randomY == 2 || randomX + randomY == 0 || randomX + lastRowHit > 9 || randomY + lastColumnHit > 9 || lastRowHit + randomX < 0 || lastColumnHit + randomY < 0 || humanBoard.board[lastRowHit + randomX][lastColumnHit + randomY] == 'm' || humanBoard.board[lastRowHit + randomX][lastColumnHit + randomY] == 'h');
    if(tooManyTries <= 50)
    {
      probeX = lastRowHit + randomX;
      probeY = lastColumnHit + randomY;
      if(humanBoard.board[probeX][probeY] == 'e')
      {
        humanBoard.board[probeX][probeY] = 'm';
        turnsToProbe--;
        useRandom = false;
      }
      else if(humanBoard.board[probeX][probeY] == 's')
      {
        humanBoard.board[probeX][probeY] = 'h';
        lastRowHit = probeX;
        lastColumnHit = probeY;
        turnsToProbe = 4;
      }
      humanTurn = true;
    }
    else
    {
      turnsToProbe = 0;
      do
      {
        randomRow = int(random(0,10));
        randomColumn = int(random(0,10));
      }
      while(humanBoard.board[randomRow][randomColumn] == 'h' || humanBoard.board[randomRow][randomColumn] == 'm');
      if(humanBoard.board[randomRow][randomColumn] == 'e')
      {
        humanBoard.board[randomRow][randomColumn] = 'm';
      }
      else if(humanBoard.board[randomRow][randomColumn] == 's')
      {
        humanBoard.board[randomRow][randomColumn] = 'h';
        lastRowHit = randomRow;
        lastColumnHit = randomColumn;
        turnsToProbe = 4;
      }
      humanTurn = true;
    }
  }
}

void createCompShips()
{
  if(compShipCount > 1)
  {
    if(compThreeBoatMade == false)
    {
      preSize = compShipCount;
    }
    if(compShipCount == 3 && compThreeBoatMade == false)
    {
      compShipCount++;
      compThreeBoatMade = true;
    }
    if(compThreeBoatMade == true && compShipCount <= 3)
    {
      preSize = compShipCount;
    }
    if(random(1) <= .5)
    {
      preVertical = true;
      ;
    }
    else
    {
      preVertical = false;
    }
    if(preVertical == true)
    {
      do
      {
        preX = int(random(0,10));
        preY = int(random(0,10));
      }
      while(preSize + preY >= 10);
    }
    else
    {
      do
      {
        preX = int(random(0,10));
        preY = int(random(0,10));
      }
      while(preSize + preX >= 10);
    }
    compShip1[otherCompCount] = new CompShip(preX,preY,preSize,preVertical);
    compShip1[otherCompCount].placeShip();
    compShipCount--;
    otherCompCount++;
    if(compShipCount == 1)
    {
      setUpCompShips = false;
    }
  }
}

void instructions()
{
  background(0);
  fill(255);
  if(someoneWon == false)
  {
    if(setUpShips == true && numberShipsSetUp == 5)
    {
      text("Click where you want your 5 ship set up", 200,300);
      text("You can press spacebar to change the orientation of the boats",200,320);
    }
    else if(setUpShips == true && numberShipsSetUp == 4)
    {
      text("Click where you want your 4 ship set up", 200,300);
      text("You can press spacebar to change the orientation of the boats",200,320);
    }
    else if(setUpShips == true && numberShipsSetUp == 3)
    {
      text("Click where you want your 3 ship set up", 200,300);
      text("You can press spacebar to change the orientation of the boats",200,320);
    }
    else if(setUpShips == true && numberShipsSetUp == 3 && threeBoatMade == false)
    {
      text("Click where you want your other 3 ship set up", 200,300);
      text("You can press spacebar to change the orientation of the boats",200,320);
    }
    else if(setUpShips == true && numberShipsSetUp == 2)
    {
      text("Click where you want your 2 ship set up", 200,300);
      text("You can press spacebar to change the orientation of the boats",200,320);
    }
    if(setUpShips == false)
    {
      text("Click a square on your opponent's grid to fire your missile", 200,300);
    }
    fill(255,0,0);
    rect(255,50,10,10);
    fill(255);
    text("Hit",267,60);
    fill(160,32,240);
    rect(255,80,10,10);
    fill(255);
    text("Miss",267,90);
    fill(255,255,0);
    rect(255,110,10,10);
    fill(255);
    text("Set",267,120);
    fill(255);
    rect(255,140,10,10);
    text("Empty",267,150);
  }
  else if(humanWins == true)
  {
    fill(255);
    text("Human Wins", 200,300);
  }
  else if(computerWins == true)
  {
    fill(255);
    text("Computer Wins", 200,300);
  }
}
void mouseClicked()
{
  if(threeBoatMade == false)
  {
    preSize = numberShipsSetUp;
  }
  if(numberShipsSetUp == 3 && threeBoatMade == false)
  {
    numberShipsSetUp++;
    threeBoatMade = true;
  }
  if(threeBoatMade == true && numberShipsSetUp <= 3)
  {
    preSize = numberShipsSetUp;
  }
  if(numberShipsSetUp > 1 && overLappingShip(mouseX,mouseY) == false && setUpShips == true)
  {
    preX = mouseX / 25;
    preY = mouseY / 25;
    ship1[otherCount] = new Ship(preX,preY,preSize,preVertical);
    ship1[otherCount].placeShip();
    numberShipsSetUp--;
    otherCount++;
    if(numberShipsSetUp == 1)
    {
      setUpShips = false;
    }
  }

  else if(setUpShips == false && humanTurn == true && (mouseX - 300)/25 >= 0 && (mouseX - 300)/25 <=9 && mouseY / 25 >= 0 && mouseY / 25 <= 9)
  {
    if(compBoard1.board[(mouseX - 300)/25][mouseY/25] == 's')
    {
      humanTurn = false;
      compBoard1.board[(mouseX - 300)/25][mouseY/25] = 'h';
    }
    else if(compBoard1.board[(mouseX - 300)/25][mouseY/25] == 'e')
    {
      humanTurn = false;
      compBoard1.board[(mouseX - 300)/25][mouseY/25] = 'm';
    }
  }
}

void keyTyped()
{
  if(key == ' ')
  {
    preVertical = !preVertical;
    key = ']';
  }
}

void mouseMoved()
{
  if(setUpShips == true && preVertical == true)
  {
    stroke(0,0,255);
    line(mouseX, mouseY, mouseX, mouseY + numberShipsSetUp*25 - 20);
  }
  else if(setUpShips == true && preVertical == false)
  {
    stroke(0,0,255);
    line(mouseX, mouseY, mouseX + numberShipsSetUp*25 - 20, mouseY);
  }
}

boolean overLappingShip(int x, int y)
{
  if(preVertical == true)
  {
    if(x / 25 < 0 || x / 25 > 10 || y / 25 < 0 || y / 25 + preSize > 10)
    {
      return true;
    }
  }
  else if(preVertical == false)
  {
    if(x / 25 < 0 || x / 25 + preSize > 10 || y / 25 < 0 || y / 25 > 10)
    {
      return true;
    }
  }
  else if(humanBoard.board[x / 25][y / 25 ] == 's')
  {
    return true;
  }
  else
  {

    return false;
  }
  return false;
}

class Ship
{
  int size1;
  int numSquaresHit;
  int x;
  int y;
  int coordX;
  int coordY;
  boolean vertical;

  Ship(int x1,int y1, int size2, boolean vert)
  {
    x = x1;
    y = y1; 
    coordX = x1*25;
    coordY = y1*25;
    size1 = size2;
    vertical = vert;
  }

  void placeShip()
  {
    if(vertical == false)
    {
      for(int k = x; k < x + size1; k++)
      {
        humanBoard.board[k][y] = 's';
      }
    }
    else
    {
      for(int l = y; l < y + size1; l++)
      {
        humanBoard.board[x][l] = 's';
      }
    }
  }
}

class Board
{
  int x;
  int y;
  char[][] board = new char[10][10];
  //e = empty h = hit m = miss s = set
  Board(int x1, int y1)
  {
    x = x1;
    y = y1;
    for(int i  = 0; i <= 9; i++)
    {
      for(int j = 0; j <= 9; j++)
      {
        fill(255);
        stroke(0);
        rect(x + i*25,y + j*25, 25,25);
        board[i][j] = 'e';
      }
    }
  }
  void drawSquares()
  {
    for(int i = 0; i <= 9; i++)
    {
      for(int j = 0; j <= 9; j++)
      {
        if(board[i][j] == 'e')
        {
          fill(255);
        }
        else if(board[i][j] == 's')
        {
          fill(255,255,0);
        }
        else if(board[i][j] == 'h')
        {
          fill(255,0,0);
        }
        else if(board[i][j] == 'm')
        {
          fill(160,32,240);
        }
        stroke(0);
        rect(x + i*25,y + j*25, 25,25);
      }
    }
  }
}

class CompBoard extends Board
{
  CompBoard(int x1, int y1)
  {
    super(x1,y1);
  }
  void drawSquares()
  {
    for(int i = 0; i <= 9; i++)
    {
      for(int j = 0; j <= 9; j++)
      {
        if(board[i][j] == 'e' || board[i][j] == 's')
        {
          fill(255);
        }
        else if(board[i][j] == 'h')
        {
          fill(255,0,0);
        }
        else if(board[i][j] == 'm')
        {
          fill(160,32,240);
        }
        stroke(0);
        rect(x + i*25,y + j*25, 25,25);
      }
    }
  }
}

class CompShip extends Ship
{
  CompShip(int x1,int y1, int size2, boolean vert)
  {
    super(x1,y1,size2,vert);
  }
  void placeShip()
  {
    if(vertical == false)
    {
      for(int k = x; k < x + size1; k++)
      {
        compBoard1.board[k][y] = 's';
      }
    }
    else
    {
      for(int l = y; l < y + size1; l++)
      {
        compBoard1.board[x][l] = 's';
      }
    }
  }
}











