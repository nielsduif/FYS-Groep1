int[] cellSizePerLevel= {100, 100, 100};
int currentSize = 0;

LevelSizer levelSizer = new LevelSizer();

class LevelSizer {
  void generateStart() {
    grid.w = cellSizePerLevel[currentSize];
    grid.start();
  }

  void generateUpdate() {
    grid.update();
  }

  void rescaleLevel() {
    grid.grid.clear();
    grid.stack.clear();
    if (currentSize+1 < cellSizePerLevel.length) {
      currentSize++;
      grid.w = cellSizePerLevel[currentSize];
      grid.start();
      pathFinding.start();
    }
  }
}
