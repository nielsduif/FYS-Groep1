TileSet tileSet = new TileSet();

int tileAmount = 15;
PImage[] tileImages = new PImage[tileAmount];

class TileSet { 
  void loadTileImages() {
    for (int i = 0; i < tileAmount; i++) {
      tileImages[i] = loadImage("Tile" + i + ".png");
    }
  }

  void drawTile(int pTileID, float pPosX, float pPosY, int pTilePixelSize) {
    //int tilePixelSize = 512;
    image(tileImages[pTileID], pPosX, pPosY, pTilePixelSize, pTilePixelSize);
  }

  void giveCellsID() {
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
    }
    for (int i=0; i < grid.grid.size(); i++) {
      println(grid.grid.get(i).tileID);
      drawTile(grid.grid.get(i).tileID, grid.grid.get(i).x * grid.grid.get(i).w, grid.grid.get(i).y * grid.grid.get(i).w, 100);
    }
  }
}
