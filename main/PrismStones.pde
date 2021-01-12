/*
author(s): Jordy Wolf [500848484]
 purpose:   This script makes you able to use prism stones and keeps track of how many you have, UI included.
 */

PrismStones prismStone = new PrismStones();

//class van de prismstones
class PrismStones {
  int stoneCount = 10;
  PImage prismStoneImage;
  boolean prismStoneUsed = false;
  int prismStonePixelSize;
  int textY = 60;
  PrismStones[] prismStones = new PrismStones[stoneCount];

  float prismStoneX, prismStoneY;
  float prismStoneTileX, prismStoneTileY;

  //Functie om een lege prismstone aan te maken en hem de locatie geven van de speler
  void usePrismStone() {
    if (stoneCount > 0) {
      prismStones[stoneCount - 1] = new PrismStones();
      prismStones[stoneCount - 1].prismStoneX = player.x;
      prismStones[stoneCount - 1].prismStoneY = player.y - prismStonePixelSize / 2;
      prismStones[stoneCount - 1].prismStoneTileX = floor(prismStones[stoneCount - 1].prismStoneX / grid.w);
      prismStones[stoneCount - 1].prismStoneTileY = floor(prismStones[stoneCount - 1].prismStoneY / grid.w);
      playSound(prismstone);
      stoneCount--;
    }
  }

  //Funtie om alle prismstones te drawen als ze in zicht zijn
  void updatePrismStones() {
    checkInputPrismStone();
    for (int i = 0; i < prismStones.length; i++) {
      if (prismStones[i] != null) {
        player.drawObjectInView(prismStoneImage, prismStones[i].prismStoneX, prismStones[i].prismStoneY, prismStonePixelSize, prismStonePixelSize);
      }
    }
  }

  //Functie om alle prismstones te resetten
  void resetPrismStones() {
    for (int i = 0; i < prismStones.length; i++) {
      prismStones[i] = null;
    }
    stoneCount = 10;
  }

  //Functie om te checken of er input is. Zo ja, gebruik een prismstone
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

  //Functie die de UI van de prismstones behandeld
  void prismStoneUI() {
    fill(255, 255, 255, player.returnUiAlpha());
    textAlign(CORNER);
    textSize(30);
    text("Prismstones: " + stoneCount, width - 325, textY);
  }
}
