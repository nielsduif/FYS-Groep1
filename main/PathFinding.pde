PathFinding pathFinding = new PathFinding();

class PathFinding {
  float Ex, Ey, Ew;
  Cell current;
  ArrayList<Cell> path = new ArrayList<Cell>();

  void start() {
    Cell spawnCell = grid.grid.get(int(random(grid.grid.size())));
    Ex = spawnCell.x * spawnCell.w + spawnCell.w * .5;
    Ey = spawnCell.y * spawnCell.w + spawnCell.w * .5;
    Ew = spawnCell.w * .5;
    println("spawn enemy " + spawnCell.x + "x ", spawnCell.y + "y");
    current = spawnCell;
  }

  void update() {
    Cell next = current.checkNeighbors();
    if (next!=null) {
    
    }
  }

  void draw() {
    fill(255, 0, 0);
    ellipse(Ex, Ey, Ew, Ew);
  }
}
