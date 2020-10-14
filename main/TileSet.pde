TileSet tileSet = new TileSet();

class TileSet { 
  int tileAmount = 17;
  int randomTile;
  boolean tileAccepted = false;
  boolean exitGateOpen = false;
  boolean idGiven = false;
  PImage[] tileImages = new PImage[tileAmount];
  PImage visionFade;

  void loadTileImages() {
    for (int i = 0; i < tileAmount; i++) {
      tileImages[i] = loadImage("Tile" + i + ".png");
    }
    prismStone.prismStoneImage = loadImage("PrismStone.png");
    visionFade = loadImage("Fade.png");
  }

  void drawTile(int pTileID, float pPosX, float pPosY, int pTilePixelSize) {
    image(tileImages[pTileID], pPosX, pPosY, pTilePixelSize, pTilePixelSize);
  }

  void updateMazeTiles() {
    background(0);

    float tileLocationX = floor(player.x / grid.w);
    float tileLocationY = floor(player.y / grid.w);

    for (int i=0; i < grid.grid.size(); i++) {
      if (tileLocationX == grid.grid.get(i).x && tileLocationY == grid.grid.get(i).y) {
        drawTile(grid.grid.get(i).tileID, grid.grid.get(i).x * grid.grid.get(i).w, grid.grid.get(i).y * grid.grid.get(i).w, grid.grid.get(i).w);
        drawTilesInView(i, grid.grid.get(i).walls[0], grid.grid.get(i).walls[1], grid.grid.get(i).walls[2], grid.grid.get(i).walls[3]);
      }
      if (tileLocationX == grid.grid.get(randomTile).x && tileLocationY == grid.grid.get(randomTile).y) {
        updateExit();
      }
    }
    giveRandomTileExit();
    //drawVisionBlur();
  }

  void drawTilesInView(int pTileID, boolean pWallU, boolean pWallR, boolean pWallD, boolean pWallL) {
    if (pWallU == false) {
      int nextTile = pTileID - grid.cols;
      drawTile(grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, grid.grid.get(nextTile).walls[0], true, true, true);
    }
    if (pWallR == false) {
      int nextTile = pTileID + 1;
      drawTile(grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, true, grid.grid.get(nextTile).walls[1], true, true);
      if (grid.grid.get(nextTile).x == grid.grid.get(randomTile).x && grid.grid.get(nextTile).y == grid.grid.get(randomTile).y) {
        updateExit();
      }
    }
    if (pWallD == false) {
      int nextTile = pTileID + grid.cols;
      drawTile(grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, true, true, grid.grid.get(nextTile).walls[2], true);
    }
    if (pWallL == false) {
      int nextTile = pTileID - 1;
      drawTile(grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, true, true, true, grid.grid.get(nextTile).walls[3]);
      if (grid.grid.get(nextTile).x == grid.grid.get(randomTile).x && grid.grid.get(nextTile).y == grid.grid.get(randomTile).y) {
        updateExit();
      }
    }
  }

  void giveCellsID() {
    if (idGiven == false) {
      for (int i=0; i < grid.grid.size(); i++) {
        if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 0;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 1;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 2;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 3;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 4;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 5;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 6;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 7;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 8;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 9;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 10;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 11;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 12;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 13;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 14;
        } else {
          println("geen juiste tile gevonden");
        }
        idGiven = true;
      }
    }
  }

  void giveRandomTileExit() {
    if (tileAccepted == false) {
      randomTile = int(random(grid.grid.size()));
      if (grid.grid.get(randomTile).walls[0] == true && grid.grid.get(randomTile).tileID != 2 && grid.grid.get(randomTile).tileID != 3 && grid.grid.get(randomTile).tileID != 11 && grid.grid.get(randomTile).tileID != 12) {
        tileAccepted = true;
        println("exit: " + grid.grid.get(randomTile).x + "x " + grid.grid.get(randomTile).y + "y");
      } else giveRandomTileExit();
    }
  }

  void updateExit() {
    if (tileAccepted == true) {
      if (exitGateOpen == false) {
        drawTile(15, grid.grid.get(randomTile).x * grid.grid.get(randomTile).w, grid.grid.get(randomTile).y * grid.grid.get(randomTile).w, grid.grid.get(randomTile).w);
      } else {
        drawTile(16, grid.grid.get(randomTile).x * grid.grid.get(randomTile).w, grid.grid.get(randomTile).y * grid.grid.get(randomTile).w, grid.grid.get(randomTile).w);
      }
    }
  }

  void drawVisionBlur() {
    int size = 25;
    image(visionFade, player.x - (grid.w * size / 2), player.y - (grid.w * size / 2), grid.w * size, grid.w * size);
  }
}
