/*
author: Niels Duivenvoorden[500847100]
 purpose:   regeling van verschillende groottes van de maze, en oneindig spelen tot je dood gaat
 */

int[] cellSizePerLevel= {200, 200, 200};
int[] enemiesPerLevel = {0, 0, 0};
int currentSize = 0;

LevelSizer levelSizer = new LevelSizer();

class LevelSizer {
  void generateStart() {
    grid.grid.clear();
    grid.stack.clear();
    grid.deletedWalls = false;
    grid.doneGenerating = false;
    tileSet.idGiven = false;
    tileSet.exitGateOpen = false;
    grid.w = cellSizePerLevel[currentSize];
    grid.start();
    score.score = 0;
    createKeyOnce = false;  
    createCoinOnce = false;
    coinHandler.coinAmount = 10;
    coinHandler.coins = new Coin[coinHandler.coinAmount];
    coinHandler.createCoin();
    keyHandler.count = 3;
    keyHandler.keys = new Keys[keyHandler.count];
    keyHandler.createKeys();
    prismStone.stoneCount = 10;
    prismStone.prismStones = new PrismStones[prismStone.stoneCount];
    prismStone.prismStonePixelSize = (grid.w / 6);
    powerupHandler.loadPowerupsOnce = false;
    powerupHandler.powerups = new PowerUpHandler.Powerup[powerupHandler.powerupAmount];
    powerupHandler.currentPowerup = 0;
    monsterAmount = currentSize + 1;
    pathFinding = new PathFinding[monsterAmount];
    for (int i = 0; i < pathFinding.length; i++) {
      pathFinding[i] = new PathFinding();
      pathFinding[i].start();
    }
    player.start();
    imageLoader.loadTileImages();
    powerupHandler.loadPowerups();
  }

  void generateUpdate() {
    grid.update();
  }

  void rescaleLevel() {
    grid.grid.clear();
    grid.stack.clear();
    grid.deletedWalls = false;
    grid.doneGenerating = false;
    keyHandler.count = 3;
    prismStone.stoneCount = 10;
    prismStone.prismStones = new PrismStones[prismStone.stoneCount];
    createKeyOnce = false;
    tileSet.idGiven = false;
    tileSet.exitGateOpen = false;

    if (currentSize+1 < cellSizePerLevel.length) {
      currentSize++;
      grid.w = cellSizePerLevel[currentSize];
      grid.start();
      player.start();
      monsterAmount = enemiesPerLevel[currentSize];
      pathFinding = new PathFinding[monsterAmount];
      for (int i = 0; i < pathFinding.length; i++) {
        pathFinding[i] = new PathFinding();
        pathFinding[i].start();
        pathFinding[i].monsterImage = loadImage("monster.png");
      }       
      createKeyOnce = false;  
      createCoinOnce = false;
      coinHandler.coinAmount = 10;
      coinHandler.coins = new Coin[coinHandler.coinAmount];
      coinHandler.createCoin(); 
      keyHandler.count = 3;
      keyHandler.keys = new Keys[keyHandler.count];
      keyHandler.createKeys();
      powerupHandler.loadPowerupsOnce = false;
      powerupHandler.loadPowerups();
      powerupHandler.currentPowerup = 0;
    } else {
      grid.grid.clear();
      grid.stack.clear();
      grid.deletedWalls = false;
      grid.doneGenerating = false;
      keyHandler.count = 3;
      prismStone.stoneCount = 10;
      prismStone.prismStones = new PrismStones[prismStone.stoneCount];
      createKeyOnce = false;
      tileSet.idGiven = false;
      tileSet.exitGateOpen = false;
      grid.w = cellSizePerLevel[currentSize];
      grid.start();
      player.start();
      monsterAmount = enemiesPerLevel[currentSize];
      pathFinding = new PathFinding[monsterAmount];
      for (int i = 0; i < pathFinding.length; i++) {
        pathFinding[i] = new PathFinding();
        pathFinding[i].start();
        pathFinding[i].monsterImage = loadImage("monster.png");
      }       
      createKeyOnce = false;  
      createCoinOnce = false;
      coinHandler.coinAmount = 10;
      coinHandler.coins = new Coin[coinHandler.coinAmount];
      coinHandler.createCoin(); 
      keyHandler.count = 3;
      keyHandler.keys = new Keys[keyHandler.count];
      keyHandler.createKeys();
      powerupHandler.loadPowerupsOnce = false;
      powerupHandler.loadPowerups();
      powerupHandler.currentPowerup = 0;
    }
  }
}
