PathFinding pathFinding = new PathFinding();

class PathFinding {
  float Ex, Ey, Ew;
  Cell current;

  float speed = 1;

  ArrayList<Cell> path = new ArrayList<Cell>();

  void start() {
    Cell spawnCell = grid.grid.get(int(random(grid.grid.size())));
    Ex = spawnCell.x * spawnCell.w + spawnCell.w * .5;
    Ey = spawnCell.y * spawnCell.w + spawnCell.w * .5;
    Ew = spawnCell.w * .3;
    println("spawn enemy " + spawnCell.x + "x ", spawnCell.y + "y");
    current = spawnCell;
  }

  void update() {
    for (int i=0; i<grid.grid.size(); i++) {
      if (grid.grid.get(i).x == floor(Ex / grid.w) && grid.grid.get(i).y == floor(Ey / grid.w)) {
        current = grid.grid.get(i);
      }
    }

    ArrayList<Cell> pathNeighbors = new ArrayList<Cell>();

    Cell top    = grid.grid.get(grid.index(current.x, current.y - 1));
    Cell right  = grid.grid.get(grid.index(current.x + 1, current.y));
    Cell bottom = grid.grid.get(grid.index(current.x, current.y + 1));
    Cell left   = grid.grid.get(grid.index(current.x - 1, current.y));

    if (!current.walls[0] && !top.walls[2]) {
      pathNeighbors.add(top);
    }  
    if (!current.walls[1] && !bottom.walls[3]) {
      pathNeighbors.add(right);
    }  
    if (!current.walls[2] && !right.walls[0]) {
      pathNeighbors.add(bottom);
    }  
    if (!current.walls[3] && !left.walls[1]) {
      pathNeighbors.add(left);
    }

    fill(100, 100, 100, 50);
    rect(top.x * grid.w, top.y * grid.w, grid.w, grid.w);
    rect(right.x * grid.w, right.y * grid.w, grid.w, grid.w);
    rect(bottom.x * grid.w, bottom.y * grid.w, grid.w, grid.w);
    rect(left.x * grid.w, left.y * grid.w, grid.w, grid.w);

    for (int i=0; i<pathNeighbors.size(); i++) {
      fill(0, 255, 0, 50);
      rect(pathNeighbors.get(i).x * grid.w, pathNeighbors.get(i).y * grid.w, grid.w, grid.w);
    }
  }

  void draw() {
    fill(255, 0, 0);
    circle(Ex, Ey, Ew);
  }
}
