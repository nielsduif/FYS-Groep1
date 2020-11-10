/*
author(s): Andrew Silos [500849454]
purpose: De score word gehouden en opbeeld gezet in deze script 
*/

//Er word een class aan gemaakt om de score bij te kunnen houden
Score score= new Score();
class Score {
  int score;

// De text word op het scherm geplaatst 
  void draw() {
    text ("Score: " + score, width - 325, 98);
  }
}
