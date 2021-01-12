/*
author(s): Andrew Silos [500849454]
 purpose: De score word gehouden en opbeeld gezet in deze script 
 */

//Er word een class aan gemaakt om de score bij te kunnen houden
Score score = new Score();
class Score {
  int score;
  float textSpace = 35;
  int startScore = 180, tracker, startTime, duration = 180, newScore;
  boolean alive;

  void start() {
    startTime = millis();
    alive = true;
  }

  // De text wordt op het scherm geplaatst 
  void draw() {
    textAlign(CORNER);
    textSize(30);
    if (tracker < duration && alive) {
      newScore = duration - ((millis() - startTime)/1000) + score;
      tracker = ((millis() - startTime)/1000);
    } else {
      newScore = score;
    }
    text("Score: " + newScore, width - 325, prismStone.textY + textSpace);
  }
}
