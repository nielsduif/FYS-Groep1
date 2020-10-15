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
    current = grid.grid.get(Ex / grid.w, Ey / grid.w);
    
    println(Ex,Ey);
    Cell top    = grid.grid.get(grid.index(current.x,current.y - 1));
    //Cell right  = grid.grid.get(grid.index(int(Ex+1), int(Ey)));
    //Cell bottom = grid.grid.get(grid.index(int(Ex), int(Ey+1)));
    //Cell left   = grid.grid.get(grid.index(int(Ex-1), int(Ey)));

    //println(current.walls[0], grid.grid.get(grid.index(current.x, current.y-1)).walls[2]);
    if (!current.walls[0] && !grid.grid.get(grid.index(current.x, current.y-1)).walls[2]) {
      Ey-=speed;
    } else {
      //println("bro");
    }

    rect(top.x, top.y, 20, 20);
  }

  void draw() {
    fill(255, 0, 0);
    circle(Ex, Ey, Ew);
  }
}
