/*
author(s): Niels Duivenvoorden [500847100]
 purpose:   This script makes an enemy, places it on a random location in the grid and also does the pathfinding for the enemy
 */

//aanmaken object
int monsterAmount;
PathFinding Monster = new PathFinding();
PathFinding[] pathFinding;

class PathFinding {
  PImage monsterImage; //plaatje vijand
  PImage monsterImageMad; //plaatje vijand mad
  float monsterW = (grid.w / 3) - 5;
  float monsterH = monsterW * 2;

  float Ex, Ey, Ew; //posities
  Cell current; //huidige cell van de enemy

  float walkSpeed;
  float speed = round(2 * grid.w / 100); //snelheid op basis van de spelgrootte

  Cell lastCell; //cell van vorige bezochte cell

  Cell nextCell = null; //volgende cell
  boolean moving = false;

  boolean inSight = false; //speler en vijand zien elkander

  int startTime, powerUpFrames = 180; 
  boolean showEnemy;
  float enemyDistance;

  void start() {
    Cell spawnCell = grid.grid.get(int(random(grid.grid.size()))); //spawncell vijand op een random cell in het grid
    if (spawnCell.x < player.tileLocationX + tileSet.visionCap && spawnCell.y < player.tileLocationY + tileSet.visionCap) {
      spawnCell = grid.grid.get(int(random(20, grid.grid.size())));
      println("kut enemy");
    } 
    Ex = spawnCell.x * spawnCell.w + spawnCell.w * .5; //plaatsing in het midden van de cell x-as
    Ey = spawnCell.y * spawnCell.w + spawnCell.w * .5; //plaatsing in het midden van de cell y-as
    Ew = spawnCell.w * .3;
    println("spawn enemy " + spawnCell.x + "x ", spawnCell.y + "y", "speed " + speed);
    current = spawnCell; //hudige cell bijwerken
    speed = round(2 * grid.w / 100);
  }

  void update() {
    for (int i=0; i<grid.grid.size(); i++) {
      if (grid.grid.get(i).x == floor(Ex / grid.w) && grid.grid.get(i).y == floor(Ey / grid.w)) {
        current = grid.grid.get(i); //huidige cell bijhouden op basis van positie
      }
    }
    if (showEnemy && !inSight) {     
      fill(50, 50, 50, 100);
      circle(Ex, Ey, Ew);   
      imageMode(CENTER);
      //println(monsterImage, Ex, Ey - monsterH / 2, monsterW, monsterH);
      if (nextCell.x * nextCell.w + nextCell.w * .5 >= Ex) {
        image(monsterImage, Ex, Ey- monsterH / 2, monsterW, monsterH);
      } else if (nextCell.x * nextCell.w + nextCell.w * .5 < Ex) {
        pushMatrix();
        scale( -1, 1 );
        image(monsterImage, -Ex, Ey- monsterH / 2, monsterW, monsterH);
        popMatrix();
      }
      imageMode(CORNER);
      if (frameCount > startTime + powerUpFrames) {
        startTime = 0;
        showEnemy = false;
      }
    }

    //lijst voor buurcellen om te bepalen waar de enemy heen mag bewegen, zie comments in de grid class
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

    //println(frameCount, moving, walkSpeed, speed);

    if (!inSight) { //zien de speler en vijand elkaar niet
      if (pathNeighbors.size() > 1 && !moving) { //bepalen volgende cell
        int r = floor(random(pathNeighbors.size()));
        if (pathNeighbors.get(r) != lastCell) {
          lastCell = current; //laatst bezochte cell bijwerken
          nextCell = pathNeighbors.get(r); //volgende cell bepalen
          moving = true;
        }
      } else if (pathNeighbors.size() == 1 && !moving) {
        nextCell = pathNeighbors.get(0);
        lastCell = current;
        moving = true;
      }
    } else {
      if (pathNeighbors.size() > 0 && !moving) { //bepalen volgende cell
        lastCell = current;

        if (current != grid.grid.get(grid.index(floor(player.x / grid.w), floor(player.y / grid.w)))) {
          nextCell = grid.grid.get(grid.index(floor(player.x / grid.w), floor(player.y / grid.w)));
          moving = true;
        } else {
          moving = false;
          if (Ex + Ew < player.x) {
            Ex += walkSpeed;
          } else if (Ex > player.x + player.playerW) {
            Ex -= walkSpeed;
          } else if (Ey + Ew < player.y) {
            Ey += walkSpeed;
          } else if (Ey > player.y + player.playerH) {
            Ey -= walkSpeed;
          }
        }
      }
      //collision met speler
      if (Ex < player.x + player.playerW && Ex + Ew > player.x && Ey < player.y + player.playerW && Ey + Ew > player.y) {
        if (gameOver.gameIsOver == false) {    
          playSound(jumpscare);
        }
        gameOver.gameIsOver = true;
        gameOver.jumpScare();
      }
    }

    //movement vijand WIP
    if (nextCell != null && Ex < nextCell.x * grid.w + grid.w * .5 && moving) {
      Ex += walkSpeed;
    } else if (nextCell != null && Ex > nextCell.x * grid.w + grid.w * .5 && moving) {
      Ex -= walkSpeed;
    } else if (nextCell != null && Ey < nextCell.y * grid.w + grid.w * .5 && moving) {
      Ey += walkSpeed;
    } else if (nextCell != null && Ey > nextCell.y * grid.w + grid.w * .5 && moving) {
      Ey -= walkSpeed;
    } else if (nextCell != null) {
      moving = false;
    }

    if (frameCount >= powerupHandler.whistleTime + 180 && powerupHandler.startWhistleTimer == true) {
      powerupHandler.startWhistleTimer = false;
    }

    if (powerupHandler.startWhistleTimer == true) {
      walkSpeed = 0;
    } else {
      walkSpeed = speed;
    }

    //  debug monster
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
        //println(monsterImage, Ex, Ey - monsterH / 2, monsterW, monsterH);
        if (current != null && nextCell != null) {
          if (nextCell.x * nextCell.w + nextCell.w * .5 >= Ex) {
            image(monsterImageMad, Ex, Ey- monsterH / 2, monsterW, monsterH);
          } else if (nextCell.x * nextCell.w + nextCell.w * .5 < Ex) {
            pushMatrix();
            scale( -1, 1 );
            image(monsterImageMad, -Ex, Ey- monsterH / 2, monsterW, monsterH);
            popMatrix();
          }
        }
        imageMode(CORNER);
        fill(50, 50, 50, 100);
        circle(Ex, Ey, Ew);
      } else if (grid.grid.get(i).x == monsterTileX && grid.grid.get(i).y == monsterTileY && grid.grid.get(i).isDrawn == false) {
        inSight = false;
      }
    }
    PathFinding closestEnemy = null;
    float closestDistance = 999999999; //deze moet de eerste keer altijd hoger zijn dan de afstand tot de enemy
    for (int i = 0; i < pathFinding.length; i++) { //check elke enemy
      if (pathFinding[i] != null) { //zorg ervoor dat het checken ook mogelijk is met minder dan 3 enemy's in het spel
        enemyDistance = dist(player.x, player.y, pathFinding[i].Ex, pathFinding[i].Ey); //bepaal de afstand tussen de player en de enemy
        if (enemyDistance < closestDistance) { //check of de enemy die gechecked wordt dichter bij de speler is dan de vorige die gechecked werd
          closestEnemy = pathFinding[i];
          closestDistance = enemyDistance;  //stel de nieuwe afstand vast als dichtst bijzijnde
        }
      }
    }
    if (gameOver.gameIsOver == false && this == closestEnemy && powerupHandler.startWhistleTimer == false) {
      //Monster footstep sound effect
      float soundAmp = 20;
      float distance = soundAmp / dist(Ex, Ey, player.x, player.y);
      if (distance > 0.5) distance = 0.5;
      if (distance < 0.02) distance = 0.01;
      monsterFootsteps.amp(distance);
      playSound(monsterFootsteps);
    }
  }
}
