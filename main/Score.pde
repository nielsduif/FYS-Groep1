Score score= new Score();
class Score {
  PFont font;
  int ellX =width /2;
  int ellY = height /2;
  int score;
  void setup () {

    size(700, 700);

    font = loadFont("ArialRoundedMTBold-48.vlw");
  }

  void draw() {

    background(0);
    textFont (font);

    fill(255, 0, 0);
    text ("Score " + score, 300, 40);
  }
}
