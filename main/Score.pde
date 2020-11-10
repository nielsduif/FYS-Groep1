Score score = new Score();

//Maak variabelen voor de score aan
class Score {
  int score;
  float textSpace = 35;

  //Laat de score zien
  void draw() {
    textAlign(CORNER);
    textSize(30);
    text("Score: " + score, width - 325, prismStone.textY + textSpace);
  }
}
