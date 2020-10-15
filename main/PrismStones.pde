PrismStones prismStone = new PrismStones();

class PrismStones {
  int stoneCount = 10;
  PImage prismStoneImage;
  boolean prismStoneUsed = false;
  int prismStonePixelSize = (grid.w / 3) - 10;
  PrismStones[] prismStones = new PrismStones[stoneCount];

  float prismStoneX, prismStoneY;
  float prismStoneTileX, prismStoneTileY;

  void usePrismStone() {
    if (stoneCount > 0) {
      prismStones[stoneCount - 1] = new PrismStones();
      prismStones[stoneCount - 1].prismStoneX = player.x - prismStonePixelSize / 2;
      prismStones[stoneCount - 1].prismStoneY = player.y - prismStonePixelSize / 2;
      prismStones[stoneCount - 1].prismStoneTileX = floor(prismStones[stoneCount - 1].prismStoneX / grid.w);
      prismStones[stoneCount - 1].prismStoneTileY = floor(prismStones[stoneCount - 1].prismStoneY / grid.w);
      stoneCount--;
    }
  }

  void updatePrismStones() {
    checkInputPrismStone();
    for (int i = 0; i < prismStones.length; i++) {
      if (prismStones[i] != null) {
        for (int j = 0; j < grid.grid.size(); j++) {
          if (grid.grid.get(j).x == prismStones[i].prismStoneTileX && grid.grid.get(j).y == prismStones[i].prismStoneTileY && grid.grid.get(j).isDrawn == true) {
            image(prismStoneImage, prismStones[i].prismStoneX, prismStones[i].prismStoneY, prismStonePixelSize, prismStonePixelSize);
          }
        }
      }
    }
  }

  void resetPrismStones() {
    for (int i = 0; i < prismStones.length; i++) {
      prismStones[i] = null;
    }
    stoneCount = 10;
  }


  void checkInputPrismStone() {
    if (keysPressed[65]) {
      if (prismStoneUsed == false) {
        prismStone.usePrismStone();
        prismStoneUsed = true;
      }
    }
    if (!keysPressed[65]) {
      prismStoneUsed = false;
    }
  }
}
