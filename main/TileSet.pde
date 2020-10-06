TileSet tileSet = new TileSet();

class TileSet { 

  int tileAmount = 17;
  int randomTile;
  boolean tileAccepted = false;
  boolean exitGateOpen = false;
  boolean idGiven = false;
  PImage[] tileImages = new PImage[tileAmount];

  void loadTileImages() {
    for (int i = 0; i < tileAmount; i++) {
      tileImages[i] = loadImage("Tile" + i + ".png");
    }
  }

  void drawTile(int pTileID, float pPosX, float pPosY, int pTilePixelSize) {
    image(tileImages[pTileID], pPosX, pPosY, pTilePixelSize, pTilePixelSize);
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
    for (int i=0; i < grid.grid.size(); i++) {
      drawTile(grid.grid.get(i).tileID, grid.grid.get(i).x * grid.grid.get(i).w, grid.grid.get(i).y * grid.grid.get(i).w, grid.grid.get(i).w);
    }
    giveRandomTileExit();
  }

  void giveRandomTileExit() {
    if (tileAccepted == false) {
      randomTile = int(random(grid.grid.size()));
      if (grid.grid.get(randomTile).walls[0] == true && grid.grid.get(randomTile).tileID != 2 && grid.grid.get(randomTile).tileID != 3 && grid.grid.get(randomTile).tileID != 11 && grid.grid.get(randomTile).tileID != 12) {
        tileAccepted = true;
        println("exit bevindt zich op: x" + grid.grid.get(randomTile).x + "y" + grid.grid.get(randomTile).y);
      } else giveRandomTileExit();
    }

    if (tileAccepted == true) {
      if (exitGateOpen == false) {
        drawTile(15, grid.grid.get(randomTile).x * grid.grid.get(randomTile).w, grid.grid.get(randomTile).y * grid.grid.get(randomTile).w, grid.grid.get(randomTile).w);
      } else {
        drawTile(16, grid.grid.get(randomTile).x * grid.grid.get(randomTile).w, grid.grid.get(randomTile).y * grid.grid.get(randomTile).w, grid.grid.get(randomTile).w);
      }
    }
  }
}
