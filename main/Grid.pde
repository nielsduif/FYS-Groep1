/*main
 setup
 grid.start();
 
 draw
 grid.update();
 */

class Grid {
  int cols, rows;
  int w = 100;

  ArrayList<Cell> grid = new ArrayList<Cell>();

  Cell current;

  ArrayList<Cell> stack = new ArrayList<Cell>();

  int executed;

  void start() {
    cols = floor(width/w);
    rows = floor(height/w);

    println(cols + " x " + rows + " = " + cols * rows + " cells");

    //cells
    for (int y=0; y< rows; y++) {
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
    if (stack.size() > 0) {
      current.highlight();
      executed++;
    } else if (executed > 1) {
      //function jordy
      println("bruh");
      executed=0;
    }

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
