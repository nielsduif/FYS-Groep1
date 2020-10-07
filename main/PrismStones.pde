class PrismStones {
  int stoneCount = 10;
  PImage prismStoneImage;
  boolean prismStoneUsed = false;
  PrismStones[] prismStones = new PrismStones[stoneCount];

  float prismStoneX, prismStoneY;

  void usePrismStone() {
    if (stoneCount > 0) {
      prismStones[stoneCount - 1] = new PrismStones();
      //prismStones[stoneCount - 1].prismStoneX = PlayerX;
      //prismStones[stoneCount - 1].prismStoneY = PlayerY;
      stoneCount--;
    }
  }

  void updatePrismStones() {
    int prismStonePixelSize = 50;
    for (int i = 0; i < prismStones.length; i++) {
      if (prismStones[i] != null) {
        imageMode(CENTER);
        image(prismStoneImage, prismStones[i].prismStoneX, prismStones[i].prismStoneY, prismStonePixelSize, prismStonePixelSize);
      }
    }
  }

  void resetPrismStones() {
    for (int i = 0; i < prismStones.length; i++) {
      prismStones[i] = null;
    }
    stoneCount = 10;
  }
}


//PrismStones prismStoneTest = new PrismStones();

//  prismStoneImage = loadImage("PrismStone.png");

//  prismStoneTest.updatePrismStones();

/*if (keyPressed) {
 if (key == 'e'|| key == 'E') {
 if (prismStoneUsed == false) {
 prismStoneTest.usePrismStone();
 prismStoneUsed = true;
 println(stoneCount);
 }
 }
 }
 }
 
 void keyReleased() {
 if (key == 'e'|| key == 'E') {
 prismStoneUsed = false;
 }
 */
