//Gregory Guterman, Comp Prog 4/5, Assignment 14: SAT Vocab Booster

boolean phase2 = false;
PFont font;
int correctbox = int(random(0,100));
int[] location = {
  50,183, 317, 450};
int[] locations = new int[4];
int[] wrongbox = new int[4];
boolean gotitright;
boolean dophases = true;
int correct = 0;
int wrong = 0;

String satWords[][]={
  {
    "abduction",	"A carrying away of a person against his will, or illegally."                          }
  ,
  {
    "accomplish",	"To bring to pass."                          }
  ,
  {
    "adhere",	"To stick fast or together."                          }
  ,
  {
    "Americanism",	"A peculiar sense in which an English word or phrase is used in the United States."                          }
  ,
  {
    "amity",	"Friendship."                          }
  ,
  {
    "analyst",	"One who analyzes or makes use of the analytical method."                          }
  ,
  {
    "annuity",	"An annual allowance, payment, or income."                          }
  ,
  {
    "aperture",	"Hole."                          }
  ,
  {
    "apothecary",	"One who keeps drugs for sale and puts up prescriptions."                          }
  ,
  {
    "arbor",	"A tree."                          }
  ,
  {
    "archipelago",	"Any large body of water studded with islands, or the islands collectively themselves."                          }
  ,
  {
    "assuage",	"To cause to be less harsh, violent, or severe, as excitement, appetite, pain, or disease."                          }
  ,
  {
    "bray",	"A loud harsh sound, as the cry of an ass or the blast of a horn."                          }
  ,
  {
    "canto",	"One of the divisions of an extended poem."                          }
  ,
  {
    "characteristic","A distinctive feature."                          }
  ,
  {
    "chronology",	"The science that treats of computation of time or of investigation and arrangement of events."                          }
  ,
  {
    "coincide",	"To correspond."                          }
  ,
  {
    "comparison",	"Examination of two or more objects with reference to their likeness or unlikeness."                          }
  ,
  {
    "complaisance","Politeness."                          }
  ,
  {
    "confluent",	"A stream that unites with another."                          }
  ,
  {
    "contradiction","The assertion of the opposite of that which has been said."                          }
  ,
  {
    "decapitate",	"To behead."                          }
  ,
  {
    "deprecate",	"To express disapproval or regret for, with hope for the opposite."                          }
  ,
  {
    "derivative",	"Coming or acquired from some origin."                          }
  ,
  {
    "descent",	"The act of moving or going downward."                          }
  ,
  {
    "discernible",	"Perceivable."                          }
  ,
  {
    "distrainor",	"One who subjects a person to distress."                          }
  ,
  {
    "doubly",	"In twofold degree or extent."                          }
  ,
  {
    "duration",	"The period of time during which anything lasts."                           }
  ,
  {
    "effrontery",	"Unblushing impudence."                          }
  ,
  {
    "egress",	"Any place of exit."                          }
  ,
  {
    "epicycle",	"A circle that rolls upon the external or internal circumference of another circle."                          }
  ,
  {
    "equitable",	"Characterized by fairness."                          }
  ,
  {
    "equivalent",	"Equal in value, force, meaning, or the like."                          }
  ,
  {
    "expect",	"To look forward to as certain or probable."                          }
  ,
  {
    "fluent",	"Having a ready or easy flow of words or ideas."                          }
  ,
  {
    "foreigner",	"A citizen of a foreign country."                          }
  ,
  {
    "further",	"More distant or advanced."                          }
  ,
  {
    "grantor",	"The maker of a deed."                          }
  ,
  {
    "habitable",	"Fit to be dwelt in."                          }
  ,
  {
    "hard-hearted","Lacking pity or sympathy."                          }
  ,
  {
    "hemorrhage",	"Discharge of blood from a ruptured or wounded blood-vessel."                          }
  ,
  {
    "illegitimate","Unlawfully begotten."                          }
  ,
  {
    "immigrate",	"To come into a country or region from a former habitat."                          }
  ,
  {
    "ingenuous",	"Candid, frank, or open in character or quality."                          }
  ,
  {
    "inhospitable","Not disposed to entertain strangers gratuitously."                          }
  ,
  {
    "instructive",	"Conveying knowledge."                          }
  ,
  {
    "introvert",	"To turn within."                          }
  ,
  {
    "joust",	"To engage in a tilt with lances on horseback."                          }
  ,
  {
    "later",	"At a subsequent time."                          }
  ,
  {
    "locative",	"Indicating place, or the place where or wherein an action occurs."                          }
  ,
  {
    "masonry",	"The art or work of constructing, as buildings, walls, etc., with regularly arranged stones."                          }
  ,
  {
    "masterpiece",	"A superior production."                          }
  ,
  {
    "mawkish",	"Sickening or insipid."                          }
  ,
  {
    "mead",	"A meadow."                          }
  ,
  {
    "medallion",	"A large medal."                          }
  ,
  {
    "meditation",	"The turning or revolving of a subject in the mind."                          }
  ,
  {
    "menace",	"A threat."                          }
  ,
  {
    "misinterpret","To misunderstand."                          }
  ,
  {
    "mongrel",	"The progeny resulting from the crossing of different breeds or varieties."                          }
  ,
  {
    "munificence",	"A giving characterized by generous motives and extraordinary liberality."                          }
  ,
  {
    "muster",	"An assemblage or review of troops for parade or inspection, or for numbering off."                          }
  ,
  {
    "orator",	"One who delivers an elaborate or formal speech."                          }
  ,
  {
    "oratory",	"The art of public speaking."                          }
  ,
  {
    "ordeal",	"Anything that severely tests courage, strength, patience, conscience, etc."                          }
  ,
  {
    "oscillate",	"To swing back and forth."                          }
  ,
  {
    "palatial",	"Magnificent."                          }
  ,
  {
    "partible",	"Separable."                          }
  ,
  {
    "pastoral",	"Having the spirit or sentiment of rural life."                          }
  ,
  {
    "pathos",	"The quality in any form of representation that rouses emotion or sympathy."                          }
  ,
  {
    "patter",	"To mumble something over and over."                          }
  ,
  {
    "pedagogics",	"The science and art of teaching."                          }
  ,
  {
    "penetrable",	"That may be pierced by physical, moral, or intellectual force."                          }
  ,
  {
    "perceive",	"To have knowledge of, or receive impressions concerning, through the medium of the body senses."                          }
  ,
  {
    "plea",	"An argument to obtain some desired action."                          }
  ,
  {
    "polytechnic",	"Pertaining to, embracing, or practicing many arts."                          }
  ,
  {
    "preference",	"An object of favor or choice."                          }
  ,
  {
    "prescient",	"Foreknowing."                          }
  ,
  {
    "presumptuous","Assuming too much."                          }
  ,
  {
    "primeval",	"Belonging to the first ages."                          }
  ,
  {
    "protection",	"Preservation from harm, danger, annoyance, or any other evil."                          }
  ,
  {
    "pseudonym",	"A fictitious name, especially when assumed by a writer."                          }
  ,
  {
    "realism",	"The principle and practice of depicting persons and scenes as they are believed really to exist."                          }
  ,
  {
    "repellent",	"Having power to force back in a manner, physically or mentally."                          }
  ,
  {
    "replica",	"A duplicate executed by the artist himself, and regarded, equally with the first, as an original."                          }
  ,
  {
    "reproof",	"An expression of disapproval or blame personally addressed to one censured."                          }
  ,
  {
    "repulse",	"The act of beating or driving back, as an attacking or advancing enemy."                          }
  ,
  {
    "resent",	"To be indignant at, as an injury or insult."                          }
  ,
  {
    "retouch",	"To modify the details of."                          }
  ,
  {
    "rudimentary",	"Being in an initial, early, or incomplete stage of development."                          }
  ,
  {
    "salient",	"Standing out prominently."                          }
  ,
  {
    "salutation",	"Any form of greeting, hailing, or welcome, whether by word or act."                          }
  ,
  {
    "somniferous",	"Tending to produce sleep."                          }
  ,
  {
    "squatter",	"One who settles on land without permission or right."                          }
  ,
  {
    "suasion",	"The act of persuading."                          }
  ,
  {
    "subvert",	"To bring to ruin."                          }
  ,
  {
    "transmission","The act of sending through or across."                          }
  ,
  {
    "triplicate",	"Composed of or pertaining to three related things or parts."                          }
  ,
  {
    "unction",	"The art of anointing as with oil."                          }
  ,
  {
    "undulous",	"Resembling waves."                          }
};

void setup()
{
  size(500,100);
  background(0);
  font = loadFont("TimesNewRomanPSMT-12.vlw");
  textFont(font,12);
  noLoop();
  textAlign(CENTER);
  textMode(SCREEN);
}
void draw()
{
  if(mousePressed == true)
  {
    dophases = false;
  }
  phase1();
  phase2();
  score();
}

void score()
{
  fill(173,255,47);
 text("Correct: " + correct + "       Wrong: " + wrong,250,80); 
}

void phase1()
{
  if(dophases == true)
  {
    if(phase2 == false)
    {
      background(0);
      correctbox = int(random(100));
      fill(0,255,0);
      strokeWeight(5);
      stroke(255,0,0);
      rect(5,35,100,20);
      rect(395,35,100,20);
      rect(135,35,100,20);
      rect(265,35,100,20);

      do
      {
        for(int i = 0; i < 3; i++)
        {
          wrongbox[i] = int(random(100));
        }
      }
      while(wrongbox[0] == correctbox || wrongbox[1] == correctbox || wrongbox[2] == correctbox || wrongbox[3] == correctbox);

      for(int j = 0; j < 4; j++)
      {
        locations[j] = location[int(random(4))];
      }
      while(locations[0] == locations[1] || locations[0] == locations[2] || locations[0] == locations[3])
      {
        locations[0] = location[int(random(4))];
      }
      while(locations[1] == locations[0] || locations[1] == locations[2] || locations[1] == locations[3])
      {
        locations[1] = location[int(random(4))];
      }
      while(locations[2] == locations[1] || locations[2] == locations[0] || locations[2] == locations[3])
      {
        locations[2] = location[int(random(4))];
      }
      while(locations[3] == locations[1] || locations[3] == locations[2] || locations[3] == locations[0])
      {
        locations[3] = location[int(random(4))];
      }
      fill(255);
      text(satWords[correctbox][1],250,10); // definition
      fill(0);
      text(satWords[correctbox][0],locations[0],50); //correct answer
      text(satWords[wrongbox[0]][0],locations[1],50);//3 wrong ones random locations
      text(satWords[wrongbox[1]][0],locations[2],50);
      text(satWords[wrongbox[2]][0],locations[3],50);
    }
  }
}

void phase2()
{
  if(dophases == true)
  {
    if(phase2 == true)
    {
      background(0);
      fill(255);
      text(satWords[correctbox][1],250,10);
      if(gotitright == true)
      {
        text("You got it right!\n Click here to try again",250,50);
      }
      else
      {
        text("Sorry! You answered wrong! The correct answer was " + satWords[correctbox][0] + "." + "\n Click here to try again",250,50);
      }
    }
  }
}

void mousePressed()
{
  if(phase2 == false)
  {
    if(mouseX <= 105 && mouseX >= 5 && mouseY <= 55 && mouseY >= 35)
    {
      stroke(0,255,0);
      fill(255,0,0);
      rect(5,35,100,20);
      fill(0);
      text(satWords[correctbox][0],locations[0],50); //correct answer
      text(satWords[wrongbox[0]][0],locations[1],50);//3 wrong ones random locations
      text(satWords[wrongbox[1]][0],locations[2],50);
      text(satWords[wrongbox[2]][0],locations[3],50);
      redraw();
    }
    else if(mouseX <= 235 && mouseX >= 135 && mouseY <= 55 && mouseY >= 35)
    {
      stroke(0,255,0);
      fill(255,0,0);
      rect(135,35,100,20);
      fill(0);
      text(satWords[correctbox][0],locations[0],50); //correct answer
      text(satWords[wrongbox[0]][0],locations[1],50);//3 wrong ones random locations
      text(satWords[wrongbox[1]][0],locations[2],50);
      text(satWords[wrongbox[2]][0],locations[3],50);
      redraw();
    }
    else if(mouseX <= 365 && mouseX >= 265 && mouseY <= 55 && mouseY >= 35)
    {
      stroke(0,255,0);
      fill(255,0,0);
      redraw();
      rect(265,35,100,20);
      fill(0);
      text(satWords[correctbox][0],locations[0],50); //correct answer
      text(satWords[wrongbox[0]][0],locations[1],50);//3 wrong ones random locations
      text(satWords[wrongbox[1]][0],locations[2],50);
      text(satWords[wrongbox[2]][0],locations[3],50);
      redraw();
    }
    else if(mouseX <= 495 && mouseX >= 395 && mouseY <= 55 && mouseY >= 35)
    {
      stroke(0,255,0);
      fill(255,0,0);
      rect(395,35,100,20);
      fill(0);
      text(satWords[correctbox][0],locations[0],50); //correct answer
      text(satWords[wrongbox[0]][0],locations[1],50);//3 wrong ones random locations
      text(satWords[wrongbox[1]][0],locations[2],50);
      text(satWords[wrongbox[2]][0],locations[3],50);
      redraw();
    }
  }
}

void mouseReleased()
{
  if(phase2 == false)
  {
    if(mouseX <= 105 && mouseX >= 5 && mouseY <= 55 && mouseY >= 35 || mouseX <= 235 && mouseX >= 135 && mouseY <= 55 && mouseY >= 35 || mouseX <= 365 && mouseX >= 265 && mouseY <= 55 && mouseY >= 35 || mouseX <= 495 && mouseX >= 395 && mouseY <= 55 && mouseY >= 35)
    {
      dophases = true;
      redraw();
    }
    else
    {
      dophases = false;
      fill(0,255,0);
      stroke(255,0,0);
      rect(5,35,100,20);
      rect(395,35,100,20);
      rect(135,35,100,20);
      rect(265,35,100,20);
      fill(0);
      text(satWords[correctbox][0],locations[0],50); 
      text(satWords[wrongbox[0]][0],locations[1],50);
      text(satWords[wrongbox[1]][0],locations[2],50);
      text(satWords[wrongbox[2]][0],locations[3],50);
      dophases = false;
      redraw();
    }
    if(mouseX <= 105 && mouseX >= 5 && mouseY <= 55 && mouseY >= 35 && locations[0] == 50)
    {
      background(0);
      phase2 = !phase2;
      gotitright = true;
      correct++;
      redraw();
    }
    else if(mouseX <= 495 && mouseX >= 395 && mouseY <= 55 && mouseY >= 35 && locations[0] == 450)
    {
      background(0);
      phase2 = !phase2;
      gotitright = true;
      correct++;
      redraw();
    }
    else if(mouseX <= 365 && mouseX >= 265 && mouseY <= 55 && mouseY >= 35 && locations[0] == 317)
    {
      background(0);
      phase2 = !phase2;
      gotitright = true;
      correct++;
      redraw();
    }
    else if(mouseX <= 235 && mouseX >= 135 && mouseY <= 55 && mouseY >= 35 && locations[0] == 183)
    {
      background(0);
      phase2 = !phase2;
      gotitright = true;
      correct++;
      redraw();
    }
    else if(mouseX <= 105 && mouseX >= 5 && mouseY <= 55 && mouseY >= 35 && locations[0] != 50)
    {
      background(0);
      phase2 = !phase2;
      gotitright = false;
      wrong++;
      redraw();
    }
    else if(mouseX <= 495 && mouseX >= 395 && mouseY <= 55 && mouseY >= 35 && locations[0] != 450)
    {
      background(0);
      phase2 = !phase2;
      gotitright = false;
      wrong++;
      redraw();
    }
    else if(mouseX <= 365 && mouseX >= 265 && mouseY <= 55 && mouseY >= 35 && locations[0] != 317)
    {
      background(0);
      phase2 = !phase2;
      gotitright = false;
      wrong++;
      redraw();
    }
    else if(mouseX <= 235 && mouseX >= 135 && mouseY <= 55 && mouseY >= 35 && locations[0] != 183)
    {
      background(0);
      phase2 = !phase2;
      gotitright = false;
      wrong++;
      redraw();
    }
  }
  else
  {
    background(0);
    phase2 = !phase2;
    redraw();
  }
}
