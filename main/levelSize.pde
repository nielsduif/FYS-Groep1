int[] cellSizePerLevel= {200, 150, 100};
int[] enemiesPerLevel = {1, 2, 3};
int currentSize = 0;

LevelSizer levelSizer = new LevelSizer();

class LevelSizer {
  void generateStart() {
    grid.w = cellSizePerLevel[currentSize];
    grid.start();
    monsterAmount = currentSize + 1;
    pathFinding = new PathFinding[monsterAmount];
    for (int i = 0; i < pathFinding.length; i++) {
      pathFinding[i] = new PathFinding();
      pathFinding[i].start();
    }
    player.start();
    imageLoader.loadTileImages();
    font = createFont("Minecraftia-Regular.ttf", 32);
    textFont(font);
  }

  void generateUpdate() {
    grid.update();
  }

  void rescaleLevel() {
    grid.grid.clear();
    grid.stack.clear();
    grid.deletedWalls = false;
    grid.doneGenerating = false;
    tileSet.idGiven = false;
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
      tileSet.exitGateOpen = false;
    }
  }
}
