PathFinding pathFinding = new PathFinding();

class PathFinding {
  float Ex, Ey, Ew;
  Cell current;

  float speed = 3;

  void start() {
    Cell spawnCell = grid.grid.get(int(random(grid.grid.size())));
    Ex = spawnCell.x * spawnCell.w + spawnCell.w * .5;
    Ey = spawnCell.y * spawnCell.w + spawnCell.w * .5;
    Ew = spawnCell.w * .3;
    println("spawn enemy " + spawnCell.x + "x ", spawnCell.y + "y");
    current = spawnCell;
  }

  void update() {
    //currentcell calc
    for (int i=0; i<grid.grid.size(); i++) {
      if (grid.grid.get(i).x == floor(Ex / grid.w) && grid.grid.get(i).y == floor(Ey / grid.w)) {
        current = grid.grid.get(i);
      }
    }

    if (Ex > player.x) {
      Ex -= speed;
    }
    if (Ey > player.y) {
      Ey -= speed;
    }
  }

  void draw() {
    fill(255, 0, 0);
    circle(Ex, Ey, Ew);
  }
}
