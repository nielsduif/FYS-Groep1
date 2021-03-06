Player player = new Player();

class Player {
  PImage playerImage;
  float x;
  float y;
  float prevX, prevY;
  float tileLocationX;
  float tileLocationY;
  float playerW;
  float playerH;
  float speed;
  float potionSpeed;
  float walkSpeed;

  void start() {
    x = grid.w * .5; 
    y = grid.w * .5;
    prevX = x;
    prevY = y;
    playerW = (grid.w / 3) - 10;
    playerH = playerW * 2;
    speed = 2 * grid.w / 100;
    potionSpeed = 3 * grid.w / 100;
  }
  void update() {
    move();
    collision();
    if (frameCount >= powerupHandler.potionTime + 180 && powerupHandler.startPotionTimer == true) { //dit is de timer voor potion powerup, die loopt voor 3 seconde
      powerupHandler.startPotionTimer = false;
    }
  }

  void draw() {
    if (gameOver.gameIsOver == false) {
      fill(50, 50, 50, 100);
      circle(x, y, playerW); // player shadow
      imageMode(CENTER);
      //circle(x, y, playerW); collision reference
      image(playerImage, x, y - playerH / 2, playerW, playerH);
      imageMode(CORNER);
    }
  }

  void move() {
    tileLocationX = floor(player.x / grid.w);
    tileLocationY = floor(player.y / grid.w);
    if (powerupHandler.startPotionTimer == true) { //zorg ervoor dat de player met de speed van de powerup loopt als de powerup is geactiveerd
      walkSpeed = potionSpeed;
    } else {
      walkSpeed = speed;
    }
    if (keysPressed[37]) {
      x-=walkSpeed;
    }  
    if (keysPressed[39]) {
      x+=walkSpeed;
    }  
    if (keysPressed[38]) {
      y-=walkSpeed;
    }  
    if (keysPressed[40]) {
      y+=walkSpeed;
    }
  }

  void collision() {
    float wallU = 0, wallR = width, wallD = height, wallL = 0;
    boolean corner = false;
    for (int i = 0; i < grid.grid.size(); i++) {
      if (player.tileLocationX == grid.grid.get(i).x && player.tileLocationY == grid.grid.get(i).y) {
        if (grid.grid.get(i).walls[0] == true) {
          wallU = (grid.w * grid.grid.get(i).y) + (grid.w / 3);
        }
        if (grid.grid.get(i).walls[1] == true) {
          wallR = (grid.w * (grid.grid.get(i).x + 1)) - (grid.w / 3);
        }
        if (grid.grid.get(i).walls[2] == true) {
          wallD = (grid.w * (grid.grid.get(i).y + 1)) - (grid.w / 3);
        }
        if (grid.grid.get(i).walls[3] == true) {
          wallL = (grid.w * grid.grid.get(i).x) + (grid.w / 3);
        }
        if (
          x - playerW / 3 <= (grid.w * grid.grid.get(i).x) + (grid.w / 3) && y - playerW / 3 <= (grid.w * grid.grid.get(i).y) + (grid.w / 3) ||
          x + playerW / 3 >= (grid.w * (grid.grid.get(i).x + 1)) - (grid.w / 3) && y - playerW / 3 <= (grid.w * grid.grid.get(i).y) + (grid.w / 3) ||
          x - playerW / 3 <= (grid.w * grid.grid.get(i).x) + (grid.w / 3) && y >= (grid.w * (grid.grid.get(i).y + 1)) - (grid.w / 3) ||
          x + playerW / 3 >= (grid.w * (grid.grid.get(i).x + 1)) - (grid.w / 3) && y >= (grid.w * (grid.grid.get(i).y + 1)) - (grid.w / 3)
          ) {
          corner = true;
        }
      }
    }
    if (x - playerW / 3 <= wallL || x + playerW / 3 >= wallR) {
      x = prevX;
    }
    if (y - playerW / 3 <= wallU || y >= wallD) {
      y = prevY;
    }
    if (corner == true) {
      x = prevX;
      y = prevY;
    }
    prevX = x;
    prevY = y;
  }

  //funcit die er voor zorgt dat objecten alleen worden gedrawed als ze in de spelers visie zijn, parameters zijn de image van het object, de locatie en de grootte.
  void drawObjectInView(PImage pImage, float pObjectX, float pObjectY, float pObjectW, float pObjectH) {
    for (int i = 0; i < grid.grid.size(); i++) {
      float objectTileX = floor(pObjectX / grid.w);
      float objectTileY = floor(pObjectY / grid.w);
      if (grid.grid.get(i).x == objectTileX && grid.grid.get(i).y == objectTileY && grid.grid.get(i).isDrawn == true) {
        imageMode(CENTER);
        image(pImage, pObjectX, pObjectY, pObjectW, pObjectH);
        imageMode(CORNER);
      }
    }
  }

  //functie om een int te returnen die de alpha van de UI aanpast voor als de speler er voor loopt.
  int returnUiAlpha() {
    if (x > width - 325 && y < prismStone.textY + score.textSpace * 2 + playerH) {
      return 100;
    } else {
      return 255;
    }
  }
}
