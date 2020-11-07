/*
author(s): Niels Duivenvoorden [500847100]
purpose:   This script makes an enemy, places it on a random location in the grid and also does the pathfinding for the enemy
*/

//aanmaken object
PathFinding pathFinding = new PathFinding();

class PathFinding {
  PImage monsterImage; //plaatje vijand
  float monsterW = (grid.w / 3) - 5;
  float monsterH = monsterW * 2;

  float Ex, Ey, Ew; //posities
  Cell current; //huidige cell van de enemy

  float speed = 2 * grid.w / 100; //snelheid op basis van de spelgrootte

  Cell lastCell; //cell van vorige bezochte cell

  Cell nextCell = null; //volgende cell
  boolean random = false;

  boolean inSight = false; //speler en vijand zien elkander

  void start() {
    Cell spawnCell = grid.grid.get(int(random(grid.grid.size()))); //spawncell vijand op een random cell in het grid
    Ex = spawnCell.x * spawnCell.w + spawnCell.w * .5; //plaatsing in het midden van de cell x-as
    Ey = spawnCell.y * spawnCell.w + spawnCell.w * .5; //plaatsing in het midden van de cell y-as
    Ew = spawnCell.w * .3;
    println("spawn enemy " + spawnCell.x + "x ", spawnCell.y + "y");
    current = spawnCell; //hudige cell bijwerken
  }

  void update() {
    for (int i=0; i<grid.grid.size(); i++) {
      if (grid.grid.get(i).x == floor(Ex / grid.w) && grid.grid.get(i).y == floor(Ey / grid.w)) {
        current = grid.grid.get(i); //huidige cell bijhouden op basis van positie
      }
    }

    //lijst boovoor buurcellen om te bepalen waar de enemy heen mag bewegen, zie comments in de grid class
    ArrayList<Cell> pathNeighbors = new ArrayList<Cell>();

    Cell top    = grid.grid.get(grid.index(current.x, current.y - 1));
    Cell right  = grid.grid.get(grid.index(current.x + 1, current.y));
    Cell bottom = grid.grid.get(grid.index(current.x, current.y + 1));
    Cell left   = grid.grid.get(grid.index(current.x - 1, current.y));

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

    if (!inSight) { //zien de speler en vijand elkaar niet
      if (pathNeighbors.size() > 1 && !random) { //bepalen volgende cell
        int r = floor(random(pathNeighbors.size()));
        if (pathNeighbors.get(r) != lastCell) {
          lastCell = current; //laatst bezochte cell bijwerken
          nextCell = pathNeighbors.get(r); //volgende cell bepalen
          random = true; 
        }
      } else if (pathNeighbors.size() == 1 && !random) {
        nextCell = pathNeighbors.get(0);
        lastCell = current;
        random = true;
      }
    } else if (pathNeighbors.size() > 0) { //vijand ziet speler
      for (int i = 0; i < pathNeighbors.size(); i++) {
        //bepaling volgende cell mgv positie speler
        if (current.y > floor(player.y / grid.w) && top != null) {
          nextCell = top;
        } else if (current.x < floor(player.x / grid.w) && right != null) {
          nextCell = right;
        } else if (current.y < floor(player.y / grid.w) && bottom != null) {
          nextCell = bottom;
        } else if (current.x > floor(player.x / grid.w) && left != null) {
          nextCell = left;
        } else { 
          if (Ex == player.x && Ey == player.y) { //speler en vijand zijn op zelfde positie
            gameOver.showGameOver();
          } else {
            nextCell = null;
            if (Ex < player.x) {
              Ex += speed;
            } else if (Ex > player.x) {
              Ex -= speed;
            }
            if (Ey < player.y) {
              Ey += speed;
            } else if (Ey > player.y) {
              Ey -= speed;
            }
          }
        }
      }
    }

    //movement vijand WIP
    if (nextCell != null && Ex < nextCell.x * grid.w + grid.w * .5) {
      Ex += speed;
    } else if (nextCell != null && Ex > nextCell.x * grid.w + grid.w * .5) {
      Ex -= speed;
    } else if (nextCell != null && Ey < nextCell.y * grid.w + grid.w * .5) {
      Ey += speed;
    } else if (nextCell != null && Ey > nextCell.y * grid.w + grid.w * .5) {
      Ey -= speed;
    } else if (nextCell != null) {
      random = false;
    }

    //debug monster
    fill(255, 50);
    rect(top.x * grid.w, top.y * grid.w, grid.w, grid.w);
    rect(right.x * grid.w, right.y * grid.w, grid.w, grid.w);
    rect(bottom.x * grid.w, bottom.y * grid.w, grid.w, grid.w);
    rect(left.x * grid.w, left.y * grid.w, grid.w, grid.w);

    for (int i = 0; i < pathNeighbors.size(); i++) {
      fill(0, 255, 0, 50);
      rect(pathNeighbors.get(i).x * grid.w, pathNeighbors.get(i).y * grid.w, grid.w, grid.w);
    }

    fill(0, 0, 255, 50);
    rect(current.x * grid.w, current.y * grid.w, grid.w, grid.w);
    if (!inSight) {
      fill(255, 0, 0, 50);
    } else {
      fill(255, 255, 0, 50);
    }
    if (nextCell != null) {
      rect(nextCell.x * grid.w, nextCell.y * grid.w, grid.w, grid.w);
    }
  }

  void draw() {
    int monsterTileX = floor(Ex / grid.w);
    int monsterTileY = floor(Ey/ grid.w);
    for (int i = 0; i < grid.grid.size(); i++) {
      if (grid.grid.get(i).x == monsterTileX && grid.grid.get(i).y == monsterTileY && grid.grid.get(i).isDrawn == true) {
        inSight = true;
        imageMode(CENTER);
        image(monsterImage, Ex, Ey- monsterH / 2, monsterW, monsterH);
        imageMode(CORNER);
        fill(50, 50, 50, 100);
        circle(Ex, Ey, Ew);
      } else if (grid.grid.get(i).x == monsterTileX && grid.grid.get(i).y == monsterTileY && grid.grid.get(i).isDrawn == false) {
        inSight = false;
      }
    }
  }
}
