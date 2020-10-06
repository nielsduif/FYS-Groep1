TileSet tileSet = new TileSet();

int tileAmount = 15;
PImage[] tileImages = new PImage[tileAmount];

class TileSet { 
  void loadTileImages() {
    for (int i = 0; i < tileAmount - 1; i++) {
      tileImages[i] = loadImage("Tile" + i + ".png");
    }
  }

  void drawTile(int pTileID, float pPosX, float pPosY) {
    int tilePixelSize = 512;
    image(tileImages[pTileID], pPosX, pPosY, tilePixelSize, tilePixelSize);
  }
}
