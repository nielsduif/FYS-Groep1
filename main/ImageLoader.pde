/*
author(s): Jordy Wolf [500848484]
 purpose:   This script loads in all images needed for the game.
 */

ImageLoader imageLoader = new ImageLoader();

//The ImageLoader class 
class ImageLoader {

  void loadTileImages() {
    for (int i = 0; i < tileSet.tileAmount; i++) { //forloop om alle tile images in te laden
      tileSet.tileImages[i] = loadImage("Tile" + i + ".png");
    }
    prismStone.prismStoneImage = loadImage("PrismStone.png");
    player.playerImage = loadImage("player.png");
    for (int i = 0; i < pathFinding.length; i++) {
      pathFinding[i].monsterImage = loadImage("monster.png");
    }    
    coinHandler.coinImage = loadImage("Coin.png");
    keyHandler.keyImage = loadImage("Key.png");

    powerUpHandler.powerupImages[0] = loadImage("ping.png");
    powerUpHandler.powerupImages[4] = loadImage("vision.png");
    powerUpHandler.powerupImages[1] = loadImage("whistle.png");
    powerUpHandler.powerupImages[2] = loadImage("potion.png");
    powerUpHandler.powerupImages[3] = loadImage("xray.png");
  }
}
