PathFinding pathFinding = new PathFinding();

class PathFinding {
  PImage monsterImage;
  float monsterW = (grid.w / 3) - 5;
  float monsterH = monsterW * 2;

  float Ex, Ey, Ew;
  Cell current;

  float speed = 2;

  Cell lastCell;

  Cell nextCell = null;
  boolean random = false;
  float destX, destY;

  boolean inSight = false;

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

    if (!inSight) {
      ArrayList<Cell> pathNeighbors = new ArrayList<Cell>();

      Cell top    = grid.grid.get(grid.index(current.x, current.y - 1));
      Cell right  = grid.grid.get(grid.index(current.x + 1, current.y));
      Cell bottom = grid.grid.get(grid.index(current.x, current.y + 1));
      Cell left   = grid.grid.get(grid.index(current.x - 1, current.y));

      if (!inSight) {
        if (!current.walls[0] && !top.walls[2]) {
          pathNeighbors.add(top);
        }  
        if (!current.walls[1] && !right.walls[3]) {
          pathNeighbors.add(right);
        }  
        if (!current.walls[2] && !bottom.walls[0]) {
          pathNeighbors.add(bottom);
        }  
        if (!current.walls[3] && !left.walls[1]) {
          pathNeighbors.add(left);
        }
      } 

      if (pathNeighbors.size() > 1 && !random) {
        int r = floor(random(pathNeighbors.size()));
        if (pathNeighbors.get(r) != lastCell) {
          lastCell = current;
          nextCell = pathNeighbors.get(r);
          random = true;
        }
      } else if (pathNeighbors.size() == 1 && !random) {
        nextCell = pathNeighbors.get(0);
        lastCell = current;
        random = true;
      }
    } else if (current.x > player.x) {
      nextCell = grid.grid.get(grid.index(current.x - 1, current.y));
    } else if (current.x < player.x) {
      nextCell = grid.grid.get(grid.index(current.x + 1, current.y));
    } else if (current.y > player.y) {
      nextCell = grid.grid.get(grid.index(current.x, current.y - 1));
    } else if (current.y > player.y) {
      nextCell = grid.grid.get(grid.index(current.x - 1, current.y));
    }

    if (nextCell != null && Ex < nextCell.x * grid.w + grid.w * .5) {
      Ex += speed;
    } else if (nextCell != null && Ex > nextCell.x * grid.w + grid.w * .5) {
      Ex -= speed;
    } else if (nextCell != null && Ey < nextCell.y * grid.w + grid.w * .5) {
      Ey += speed;
    } else if (nextCell != null && Ey > nextCell.y * grid.w + grid.w * .5) {
      Ey -= speed;
    } else {
      random = false;
    }

    fill(0, 0, 255, 50);
    rect(current.x * grid.w, current.y * grid.w, grid.w, grid.w);
    fill(255, 0, 0, 50);
    rect(nextCell.x * grid.w, nextCell.y * grid.w, grid.w, grid.w);
  }

  void draw() {
    int monsterTileX = floor(Ex / grid.w);
    int monsterTileY = floor(Ey/ grid.w);
    //println(monsterTileX + "; " + monsterTileY);
    inSight = false;
    for (int i = 0; i < grid.grid.size(); i++) {
      if (grid.grid.get(i).x == monsterTileX && grid.grid.get(i).y == monsterTileY && grid.grid.get(i).isDrawn == true) {
        inSight = true;
        imageMode(CENTER);
        image(monsterImage, Ex, Ey- monsterH / 2, monsterW, monsterH);
        imageMode(CORNER);
        circle(Ex, Ey, Ew);
      }
    }
  }
}
