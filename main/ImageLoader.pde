ImageLoader imageLoader = new ImageLoader();

class ImageLoader {

  void loadTileImages() {
    for (int i = 0; i < tileSet.tileAmount; i++) {
      tileSet.tileImages[i] = loadImage("Tile" + i + ".png");
    }
    prismStone.prismStoneImage = loadImage("PrismStone.png");
    player.playerImage = loadImage("player.png");
    pathFinding.monsterImage = loadImage("monster.png");
    coinHandler.coinImage = loadImage("Coin.png");
    keyHandler.keyImage = loadImage("Key.png");
  }
}
