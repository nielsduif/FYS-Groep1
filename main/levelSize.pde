/*
author: Niels Duivenvoorden[500847100]
 purpose:   regeling van verschillende groottes van de maze, en oneindig spelen tot je dood gaat
 */

int[] cellSizePerLevel= {200, 140, 120};
int[] enemiesPerLevel = {1, 2, 3};
int currentSize = 0;
int actualSize = 0;

LevelSizer levelSizer = new LevelSizer();

class LevelSizer {
  void showMenu() {
    menu.start();
    font = createFont("Minecraftia-Regular.ttf", 32);
    textFont(font);
    loadSound();
    tutorial.setup();
    menu.start = menu.databaseShow = menu.name = menu.selectOnce = menu.tutorialShow = menu.storyShow = false;
    menu.selected = 0;
  }

  void generateStart() {
    grid.grid.clear();
    grid.stack.clear();
    grid.deletedWalls = false;
    grid.doneGenerating = false;
    tileSet.tileAccepted = false;
    tileSet.idGiven = false;
    tileSet.exitGateOpen = false;
    currentSize = 0;
    actualSize = 0;
    grid.w = cellSizePerLevel[currentSize];
    grid.start();
    monsterAmount = enemiesPerLevel[currentSize];
    pathFinding = new PathFinding[monsterAmount];
    for (int i = 0; i < pathFinding.length; i++) {
      pathFinding[i] = new PathFinding();
      pathFinding[i].start();
    }
    score = new Score();
    score.start();
    createKeyOnce = false;  
    createCoinOnce = false;
    coinHandler.coinAmount = 10;
    coinHandler.coins = new Coin[coinHandler.coinAmount];
    coinHandler.createCoin();
    keyHandler.keyAmount = 3;
    keyHandler.count = keyHandler.keyAmount;
    keyHandler.keys = new Keys[keyHandler.count];
    keyHandler.createKeys();
    prismStone.stoneCount = 10;
    prismStone.prismStones = new PrismStones[prismStone.stoneCount];
    prismStone.prismStonePixelSize = (grid.w / 6);
    powerupHandler.loadPowerupsOnce = false;
    powerupHandler.powerups = new PowerUpHandler.Powerup[powerupHandler.powerupAmount];
    powerupHandler.currentPowerup = 0;
    player.speed = 2 * grid.w / 100;
    player.potionSpeed = 3 * grid.w / 100;
    player.start();
    imageLoader.loadTileImages();
    powerupHandler.loadPowerups();
    gameOver.jumpscareW = 100;
    gameOver.jumpscareIsPlaying = false;
    gameOver.gameIsOver = false;
  }

  void generateUpdate() {
    grid.update();
  }

  void rescaleLevel() {
    if (currentSize + 1 < cellSizePerLevel.length) {
      currentSize++;
    }
    grid.grid.clear();
    grid.stack.clear();
    grid.deletedWalls = false;
    grid.doneGenerating = false;
    tileSet.tileAccepted = false;
    tileSet.idGiven = false;
    tileSet.exitGateOpen = false;
    grid.w = cellSizePerLevel[currentSize];
    grid.start();
    monsterAmount = enemiesPerLevel[currentSize];
    pathFinding = new PathFinding[monsterAmount];
    for (int i = 0; i < pathFinding.length; i++) {
      pathFinding[i] = new PathFinding();
      pathFinding[i].start();
    }
    createKeyOnce = false;  
    createCoinOnce = false;
    coinHandler.coinAmount = 10;
    coinHandler.coins = new Coin[coinHandler.coinAmount];
    coinHandler.createCoin();
    actualSize++;
    if (actualSize > currentSize) {
      keyHandler.keyAmount = actualSize;
    } else {
      keyHandler.keyAmount = 3;
    }
    keyHandler.count = keyHandler.keyAmount;
    keyHandler.keys = new Keys[keyHandler.count];
    keyHandler.createKeys();
    prismStone.stoneCount = 10;
    prismStone.prismStones = new PrismStones[prismStone.stoneCount];
    prismStone.prismStonePixelSize = (grid.w / 6);
    powerupHandler.loadPowerupsOnce = false;
    powerupHandler.powerups = new PowerUpHandler.Powerup[powerupHandler.powerupAmount];
    powerupHandler.currentPowerup = 0;
    player.start();
    imageLoader.loadTileImages();
    powerupHandler.loadPowerups();
    tileSet.playExitSoundOnce = false;
    score.score += score.startScore;
    score.tracker = 0;
    score.startTime = millis();
    gameOver.jumpscareW = 100;
    gameOver.jumpscareIsPlaying = false;
    gameOver.gameIsOver = false;
  }
}
