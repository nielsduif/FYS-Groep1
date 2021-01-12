/*
author(s): Andrew Silos [500849454]
 purpose: De score word gehouden en opbeeld gezet in deze script 
 */

//Er word een class aan gemaakt om de score bij te kunnen houden
Score score = new Score();
class Score {
  int score;
  float textSpace = 35;

  // De text word op het scherm geplaatst 
  void draw() {
    fill(255, 255, 255, player.returnUiAlpha());
    textAlign(CORNER);
    textSize(30);
    text("Score: " + score, width - 325, prismStone.textY + textSpace);
  }
}
