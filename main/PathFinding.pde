PathFinding pathFinding = new PathFinding();

class PathFinding {
  float Ex, Ey, Ew;
  float Sx, Sy, Sw;

  void start() {
    Cell spawnCell = grid.grid.get(int(random(0, grid.grid.size())));
    Ex = spawnCell.x * spawnCell.w + spawnCell.w * .5;
    Ey = spawnCell.y * spawnCell.w + spawnCell.w * .5;
    Ew = spawnCell.w;
    println("spawning enemie at " + Ex + "x", Ey+"y");
  }

  void update() {
  
  }
}
