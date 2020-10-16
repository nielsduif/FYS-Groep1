Grid grid = new Grid();

class Grid {
  int cols, rows;
  int w = 100;
  int deletedWallsCount = 5;
  boolean deletedWalls;

  ArrayList<Cell> grid = new ArrayList<Cell>();

  Cell current;

  ArrayList<Cell> stack = new ArrayList<Cell>();

  boolean doneGenerating;

  void start() {
    doneGenerating = false;
    cols = floor(width/w);
    rows = floor(height/w);

    println(cols + " x " + rows + " = " + cols * rows + " cells");

    //cells
    for (int y=0; y < rows; y++) {
      for (int x=0; x < cols; x++) {
        Cell cell = new Cell(x, y, w);
        grid.add(cell);
      }
    }
    current = grid.get(0);
  }

  void update() {
    for (int i=0; i < grid.size(); i++) {
      grid.get(i).show();
    }

    current.visited = true; 

    // STEP 1
    Cell next = current.checkNeighbors();

    if (next != null) {
      next.visited = true;

      // STEP 2
      stack.add(current);

      // STEP 3
      removeWalls(current, next);

      // STEP 4
      current = next;
    } else if (stack.size() > 0) {
      current = stack.remove(stack.size()-1);
      current.highlight();
      doneGenerating = false;
    } else {
      doneGenerating = true;
      if (deletedWalls == false) {
        for (int i = deletedWallsCount; i > 0; i--) {
          int randomTileX = int(random(grid.size() - 1));      
          removeWalls(grid.get(randomTileX), grid.get(randomTileX + 1));
          int randomTileY = int(random(grid.size() - cols));
          if (randomTileY % cols != 0 || randomTileY % cols != cols) {
            removeWalls(grid.get(randomTileY), grid.get(randomTileY + cols));
          }
          deletedWalls = true;
        }
      }
      tileSet.giveCellsID();
      tileSet.updateMazeTiles();
    }
  }

  int index(int x, int y) {
    if (x < 0 || y < 0 || x > cols-1 || y > rows-1) {
      return 0;
    }
    return x + y * cols;
  }

  void removeWalls(Cell a, Cell b) {
    int x = a.x - b.x;
    if (x == 1) {
      a.walls[3]=false;
      b.walls[1]=false;
    } else if (x == -1) {
      a.walls[1]=false;
      b.walls[3]=false;
    }
    int y = a.y - b.y;
    if (y == 1) {
      a.walls[0] = false;
      b.walls[2] = false;
    } else if (y == -1) {
      a.walls[2] = false;
      b.walls[0] = false;
    }
  }
}
